require "pry"

class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self

    end

    def self.all 
        @@all
    end

    def self.new_by_filename(file_name)
        song_info = file_name.split(" - ")
        artist_name = song_info[0]
        song_name = song_info[1] 

        new_artist = Artist.new(artist_name)
        new_song = Song.new(song_name)
        new_song.artist = new_artist
        new_song
    end

    def artist_name=(name)
        new_instance = Artist.find_or_create_by_name(name)
        new_instance.add_song(self)
    end


end