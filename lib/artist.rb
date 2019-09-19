class Artist

    attr_accessor :artist, :name 

    @@all = []

    def initialize(name)
        @name = name
        @@all << self 
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self 
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end
    
    def self.find_or_create_by_name(name)
        if @@all.find{|artist| artist.name == name} != nil
        return @@all.find{|artist| artist.name == name}
    end
    
    Artist.new(name)
    end

    def print_songs
        songs.each {|song_class| puts song_class.name}
    end

    
end
