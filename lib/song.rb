class Song
  attr_accessor :name, :artist_name
  @@all = []

  def save
    self.class.all << self
  end
  
  class << self
    
    def all
      @@all
    end
    
    def create
      song = Song.new
      song.save
      song
    end
    
    def create_by_name(name)
      song = self.create
      song.name = name
      song
    end
    
    def new_by_name(name)
      song = Song.new
      song.name = name
      song.save
      song
    end
    
    def find_by_name(name)
      self.all.find{|song| song.name == name}
    end
    
    def find_or_create_by_name(name)
      return self.find_by_name(name) if self.find_by_name(name)
      self.create_by_name(name)
    end
    
    def alphabetical
      self.all.sort_by{|song| song.name}
    end
    
    def new_from_filename(file)
      song = self.new
      song.artist_name = file[0..file.index("-")-2]
      song.name = file[file.index("-")+2..-5]
      song
    end
    
    def create_from_filename(file)
      song = self.new_from_filename(file)
      song.save
      song
    end
    
    def destroy_all
      @@all.clear
    end
  end
end

# def self.all
#     @@all
#   end
  
#   def self.create
#     song = Song.new
#     song.save
#     song
#   end
  
#   def self.create_by_name(name)
#     song = self.create
#     song.name = name
#     song
#   end
  
#   def self.new_by_name(name)
#     song = Song.new
#     song.name = name
#     song.save
#     song
#   end
  
#   def self.find_by_name(name)
#     self.all.find{|song| song.name == name}
#   end
  
#   def self.find_or_create_by_name(name)
#     return self.find_by_name(name) if self.find_by_name(name)
#     self.create_by_name(name)
#   end
  
#   def self.alphabetical
#     self.all.sort_by{|song| song.name}
#   end
  
#   def self.new_from_filename(file)
#     song = self.new
#     song.artist_name = file[0..file.index("-")-2]
#     song.name = file[file.index("-")+2..-5]
#     song
#   end
  
#   def self.create_from_filename(file)
#     song = self.new_from_filename(file)
#     song.save
#     song
#   end
  
#   def self.destroy_all
#     @@all.clear
#   end