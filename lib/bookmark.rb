require 'PG'

class Bookmark
  attr_reader :library
  def initialize
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec('SELECT * FROM bookmarks;')
    @library = result.map { |bookmark| bookmark['url'] } 
   end
 end
