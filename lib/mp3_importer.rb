require "pry"

class MP3Importer
  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end

  def files
    @import_files = Dir.glob("#{path}/*.mp3").map { |full_path| full_path.gsub("#{@path}/", "") }
  end
end
