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
    return self.all
  end
  def self.new_by_name(name)
    self.new.name=(name)
  end
  def self.create_by_name(name)
    self.all<<self.new.name=(name)
    return self.all
  end
end
