require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    song = self.new
    song.save
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(name)
    name = name.split(" - ")
    new_artist = name[0]
    new_song = name[1].gsub(".mp3", "")
    song = self.new
    song.artist_name = new_artist
    song.name = new_song

    song
  end

  def self.create_from_filename(file_name)
# # binding.pry
#     song = self.new
    new_from_filename(file_name)
#   end


end
