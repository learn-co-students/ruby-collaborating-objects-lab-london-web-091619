class MP3Importer
  attr_reader :path, :files

  def initialize(path)
    @path = path
    @files = songs_in_dir(path)
  end

  def import
    files.each do |pathname|
      # require 'pry'; binding.pry

      filename = song_pathname_to_filename(pathname)
      Song.new_by_filename(filename)
    end
  end

  private

  def song_pathname_to_filename(song_path)
    song_path[%r{(?<=.\/spec\/fixtures\/mp3s\/).*}]
  end

  def songs_in_dir(path)
    path += '/*.mp3'
    song_paths = Dir[path]
    song_paths.map do |song_path|
      # song_path[%r{(?<=.\/spec\/fixtures\/mp3s\/).*}]
      song_pathname_to_filename(song_path)
    end
  end

  def self.parse_filename(filename)
    { song_name: filename.split(' - ')[1], artist: filename.split(' - ')[0] }
  end
end
