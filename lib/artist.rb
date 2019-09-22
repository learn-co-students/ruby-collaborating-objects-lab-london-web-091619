require "pry"

class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self
    # binding.pry
  end

  def songs
    Song.all.select { |song| song.artist == self }
  end

  def self.find_or_create_by_name(name)
    index = @@all.find_index { |artist| artist.name == name }
    index.nil? ? artist = Artist.new(name) : artist = @@all[index]
  end

  def save
    @@all << self
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end
end
