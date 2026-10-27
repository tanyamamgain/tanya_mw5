# One of the Ruby files in this repo that the browser can run: a code-along file, a lab, or a
# script in scripts/.
class RubyFile
  FOLDERS = {
    "code-along" => "Yours to fill in, in order.",
    "scripts" => "Scripts you or your agent write. A new one shows up here when you refresh.",
    "labs" => "Your turn: try it yourself first."
  }

  attr_reader :path

  # Every .rb file directly inside one of the folders above, and nothing else.
  def self.all
    FOLDERS.keys.flat_map do |folder|
      Dir.glob("*.rb", base: Rails.root.join(folder)).sort.map { |name| new("#{folder}/#{name}") }
    end
  end

  def self.in_folder(folder)
    all.select { |file| file.folder == folder }
  end

  # Only a listed file can be found, so an address typed into the browser can't run anything
  # else.
  def self.find(path)
    all.find { |file| file.path == path }
  end

  def initialize(path)
    @path = path
  end

  def folder
    File.dirname(path)
  end

  def name
    File.basename(path)
  end

  def command
    "bin/rails runner #{path}"
  end

  def source
    File.read(Rails.root.join(path))
  end

  # A file that waits for typing (gets) can only run in the terminal.
  def asks_for_input?
    code_lines = source.lines.reject { |line| line.strip.start_with?("#") }
    code_lines.join.match?(/\bgets\b/)
  end

  def run
    FileRun.new(self).call
  end
end
