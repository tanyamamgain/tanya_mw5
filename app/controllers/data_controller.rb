class DataController < ApplicationController
  # Reading the tables is kept out of log/development.log, so the bottom of the log stays the
  # SQL your own files ran.
  def show
    ActiveRecord::Base.logger.silence do
      @tables = DatabaseTable.all
      render
    end
  end
end
