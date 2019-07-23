require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    self.all<<self.new
    self.all.last
  end

  def self.new_by_name(name)
    song=self.new
    song.name=name
    song
  end

  def self.create_by_name(name)
    song=self.create
    song.name=name
    song
  end

  def self.find_by_name(song)
    self.all.find{|s| s.name == song}
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song)
      self.find_by_name(song)
    else
      self.create_by_name(song)
    end
  end

  def self.alphabetical
    Song.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    newSong=Song.new
    file_array=filename.split(" - ")
    file_array[1]=file_array[1].split(".")[0]
    newSong.name=file_array[1]
    newSong.artist_name=file_array[0]
    newSong
  end

  def self.create_from_filename(filename)
    newSong=Song.new_from_filename(filename)
    newSong.save
  end

  def self.destroy_all
    @@all=[]
  end
end
