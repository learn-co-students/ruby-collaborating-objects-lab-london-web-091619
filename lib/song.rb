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

    def artist_name=(name)
        result = Artist.find_or_create_by_name(name)
        result.add_song(self)
    end
    
    def save
        @all << self
    end

    def self.new_by_filename(file)
        info = file.split(" - ")
        song_name = info[1]
        song_artist = info[0]
        new_artist = Artist.new(song_artist)
        new_song = self.new(song_name)
        new_song.artist = new_artist
        new_song
    end



end