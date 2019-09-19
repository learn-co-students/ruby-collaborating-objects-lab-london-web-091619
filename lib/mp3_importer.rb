class MP3Importer
  attr_reader :path, :files

  def initialize(path)
    @path = path
    @files = songs_in_dir(path)
  end

  private

  def songs_in_dir(path)
    path += '/*.mp3'
    song_paths = Dir[path]
    song_paths.map do |song_path|
      song_path[%r{(?<=.\/spec\/fixtures\/mp3s\/).*}]
    end
  end
end
