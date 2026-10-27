require "open3"

# Runs one file the same way the terminal does, with bin/rails runner, in a process of its own.
# A file that loops forever, or prints without end, is stopped instead of hanging the page.
class FileRun
  TIME_LIMIT = 10 # seconds, including the second or two Rails takes to start
  MAX_OUTPUT = 20_000 # characters kept from each of output and error

  attr_reader :output, :error, :seconds

  def initialize(file)
    @file = file
  end

  def call
    started_at = now

    Open3.popen3("bin/rails", "runner", @file.path, chdir: Rails.root.to_s, pgroup: true) do |input, out, err, process|
      input.close
      output_reader = Thread.new { read_capped(out) }
      error_reader = Thread.new { read_capped(err) }

      if process.join(TIME_LIMIT).nil?
        @timed_out = true
        stop(process)
      end

      @output, @output_cut = output_reader.value
      @error, = error_reader.value
      @succeeded = process.value.success?
    end

    @seconds = (now - started_at).round(1)
    self
  end

  def timed_out?
    @timed_out == true
  end

  def failed?
    !timed_out? && !@succeeded
  end

  def output_cut?
    @output_cut
  end

  # The first line of an error is the message: the file, the line number, and what went wrong.
  def error_message
    error_lines.first
  end

  # The line of the file the error names, when it names one in this file.
  def error_line
    return unless failed? && error_message
    error_message[/\A#{Regexp.escape(@file.path)}:(\d+)/, 1]&.to_i
  end

  # The rest is where Ruby was when it happened, mostly inside Rails.
  def error_trace
    error_lines.drop(1).join("\n")
  end

  private

  def error_lines
    error.gsub("#{Rails.root}/", "").lines.map(&:chomp).reject(&:blank?)
  end

  # Keeps reading to the end, so the process never waits on a full pipe, but keeps only
  # the first MAX_OUTPUT characters.
  def read_capped(io)
    text = +""
    cut = false
    loop do
      chunk = io.readpartial(16_384)
      if text.length < MAX_OUTPUT
        text << chunk
      else
        cut = true
      end
    end
  rescue EOFError, IOError
    [text.force_encoding(Encoding::UTF_8).scrub[0, MAX_OUTPUT], cut]
  end

  # Ask politely first, so Ruby prints what it has buffered; then insist.
  def stop(process)
    Process.kill("TERM", -process.pid)
    Process.kill("KILL", -process.pid) if process.join(2).nil?
  rescue Errno::ESRCH
    # already finished
  end

  def now
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end
end
