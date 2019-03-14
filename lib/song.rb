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
    return self.all.last
  end
  def self.new_by_name(name)
    song=self.new
    song.name=name
    return song
  end
  def self.create_by_name(name)
    song=self.all
    song.name=name
    self.all<<song
    return song
  end
end
