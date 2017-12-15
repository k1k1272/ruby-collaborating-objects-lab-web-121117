class Artist
  attr_accessor :name, :songs, :artist

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song_name)
    @songs << song_name
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all.uniq
  end

  def self.find_name(name)
    @@all.find {|artist_instance| artist_instance.name == name}
  end

  def self.find_or_create_by_name(name)
    result = self.find_name(name)
    result ? result : result = self.new(name)
    result.save
  end

  def print_songs
    songs.each {|song| puts song.name}
  end

end
