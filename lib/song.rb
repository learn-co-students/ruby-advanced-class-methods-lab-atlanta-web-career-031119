require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def initialize(name, artist_name=nil)
    @name = name
    @artist_name = artist_name
  end
 
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new(name)
    @@all<<song
    song
  end

  def self.new_by_name(name)
    Song.new(name)
  end

  def self.create_by_name(name)
    song = Song.new(name)
    @@all<<song
    song
  end

  def self.find_by_name(name)
    Song.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
       self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort{|a,b| a.name<=>b.name}
  end

  def self.new_from_filename(song)
    artist_name, song_name = song.split(' - ')
    @artist_name = artist_name
    @name = song_name.chomp('.mp3')
    song_file = Song.new(@name, @artist_name)
  end

  def self.create_from_filename(song)
    artist_name, song_name = song.split(' - ')
    @artist_name = artist_name
    @name = song_name.chomp('.mp3')
    song_file = Song.new(@name, @artist_name)
    @@all<<song_file
  end

  def self.destroy_all
    @@all.clear
  end
end
