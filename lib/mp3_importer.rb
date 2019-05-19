require 'pry'

#parses a directory of files
#sends the filenames to a song class to create a library of music with artists that are unique
#To do this, you'll need two methods: Mp3Importer#files and MP3Importer #import
#Your MP3Importer class should also have a path attribute that gets set on initialization.

class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |file| file.gsub("#{path}/","") }
    #Accesses current directory with Dir.glob
    #calls each path argument that ends in ".mp3"
    #gsub reformats the end of the filename so it is just the band w/song name in the string
    #collects each of these files and puts it in an array
  end

  def import
binding.pry
    files.each{|file| Song.new_by_filename(file)}
    #creates a new song based on #new_by_filename in Song class 
  end

end
