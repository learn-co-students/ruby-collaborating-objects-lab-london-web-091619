require "pry"

class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    artist_result = Artist.find_or_create_by_name(name)
    artist_result.add_song(self)
  end

  def save
    @@all << self
  end

  def self.new_by_filename(file)
    file_info = file.split(" - ")
    track_name = file_info[1]
    track_artist = file_info[0]
    new_artist = Artist.new(track_artist)
    new_song = self.new(track_name)
    new_song.artist = new_artist
    new_song
  end
end
