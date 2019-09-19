#Create Song class with filename from mp3_importer. Send artist name to Artist class
class Song
    @@all = []
    attr_accessor :name, :artist
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        splitname = filename.split(" - ")
        artist_name = splitname[0]
        song_name = splitname[1]

        artist_inst = Artist.new(artist_name)
        song_inst = self.new(song_name)
        song_inst.artist = artist_inst
        song_inst
    end

    def artist_name=(name)
        artist_inst = Artist.find_or_create_by_name(name)
        artist_inst.add_song(self)
    end
end