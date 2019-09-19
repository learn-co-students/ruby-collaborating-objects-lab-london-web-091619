class MP3Importer

    attr_accessor :path
    
    def initialize(file_path)
        @path = file_path
    end

    def files
        @files = Dir.entries(path).select {|f| !File.directory? f}
    end

    def import 
        files.each {|file| Song.new_by_filename(file)}
    end


end

