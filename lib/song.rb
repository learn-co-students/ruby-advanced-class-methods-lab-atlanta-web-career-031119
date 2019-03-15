require 'pry'
class Song
  attr_reader :name, :artist_name
  @@all = []
  def initialize(title, artist)
    @name=title
    @artist_name=artist
  end
  def self.all
    return @@all
  end
  def save
    self.class.all << self
  end
  def self.create
    self.all<<self.new
    return self.all.last
  end
  def self.new_by_name(name)
    song=self.new
    song.name=name
    return song
  end
  def self.create_by_name(name)
    song=self.create
    song.name=name
    return song
  end
  def self.find_by_name(song)
    return self.all.find{|s| s.name == song}
  end
  def self.find_or_create_by_name(song)
    if self.find_by_name(song)
      return self.find_by_name(song)
    else
      self.create_by_name(song)
    end
  end
  def self.alphabetical
    return @@all.name.sort
  end
end
