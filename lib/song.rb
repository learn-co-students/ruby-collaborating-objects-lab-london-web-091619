class Song
  attr_accessor :artist
  attr_reader :name

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
end
