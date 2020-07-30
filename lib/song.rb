require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.new_by_name(name)
    song = Song.new 
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end 
  
  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name 
    end
  end
  
  def self.find_or_create_by_name(name)
    match = self.find_by_name(name)
    if match
      match
    else 
      self.create_by_name(name)
    end
  end 
  
  def self.alphabetical
    sorted = @@all.sort_by { |n| n.name }
    sorted
  end
  
end
