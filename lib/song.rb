class Song
  attr_accessor :artist, :name

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

  def self.new_by_filename(filename)
    parsed_filename = MP3Importer.parse_filename(filename)
    name = parsed_filename[:song_name]
    artist = parsed_filename[:artist]
    song = new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
end
