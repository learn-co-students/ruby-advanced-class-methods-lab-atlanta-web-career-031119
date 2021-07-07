class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    Song.all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    @name = name
    song.name = @name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = Song.new
    file_array = filename.chomp(".mp3").split(" - ")
    song.name = file_array[1]
    song.artist_name = file_array[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
