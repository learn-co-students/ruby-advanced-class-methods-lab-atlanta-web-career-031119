require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save << self
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save << self
    song
  end

  def self.find_by_name(name)
    for index in 0...@@all.size
      if @@all[index].name == name
        return @@all[index]
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    info = filename.split(' - ')
    song = Song.new
    song.name = info[1][0..-5]
    song.artist_name = info[0]
    song
  end


  def self.alphabetical
    @@all.delete(Song)
    @@all.sort_by { |item| item.name }
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save << self
  end




end
