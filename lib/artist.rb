class Artist
  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize(name)
    @name = name
    save
  end

  def songs
    Song.all.select { |song| song.artist.eql?(self) }
  end

  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name(name)
    all.find { |artist| artist.name.eql?(name) } || new(name)
  end

  def print_songs
    self.songs.each { |song| puts song.name }
  end
end
