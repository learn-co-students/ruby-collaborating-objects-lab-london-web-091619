class MP3Importer
  attr_reader :path, :files

  def initialize(path)
    @path = path
    @files = []

    path += '/*.mp3'
    song_paths = Dir[path]
    song_paths.each do |song_path|
      @files << song_path[%r{(?<=.\/spec\/fixtures\/mp3s\/).*}]
    end
  end
end
