#Either create Artist class or find instance of Artist class
require "pry"
class Artist
attr_accessor :name
@@all = []
 #Store all instances of Artist
#init with name that can get/set
def initialize(name)
@name = name
@@all << self
end

def self.all
    #return all Artist instances
    @@all
end

def add_song(song)
    #associates Song instance with Artist Instance (1 Artist to many Songs)
    song.artist = self
end

def songs
    #Returns all instances of Song that belong to this instance of artist
    Song.all.select {|song| song.artist == self}
end

def self.find_or_create_by_name(name)

    if @@all.find{|artist| artist.name == name} != nil
    return@@all.find {|artist| artist.name == name}\
    end
Artist.new(name)
end

def print_songs
    songs.each {|song_class| puts song_class.name}
end


end


