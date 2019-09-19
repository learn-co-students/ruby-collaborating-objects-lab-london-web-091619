class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self #class instance to populate all array
    end

    def self.all
        @@all 
    end

    def self.new_by_filename(name)
        split_name = name.split(" - ")
        song_name = self.new(split_name[1])
        song_name.artist = Artist.new(split_name[0])
        song_name
    end

    def artist_name=(name)
        artist_inst = Artist.find_or_create_by_name(name)
        artist_inst.add_song(self) 
    end



end