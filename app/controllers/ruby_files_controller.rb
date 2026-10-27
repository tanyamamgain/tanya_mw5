class RubyFilesController < ApplicationController
  def index
    @folders = RubyFile::FOLDERS.keys.index_with { |folder| RubyFile.in_folder(folder) }
  end

  def show
    @file = RubyFile.find(params[:path])
    return render :not_found, status: :not_found if @file.nil?

    @run = @file.run unless @file.asks_for_input?
  end
end
