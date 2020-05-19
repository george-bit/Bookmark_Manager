require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark manager'
  end

  get '/bookmarks' do
    p ENV
    @bookmarks = Bookmark.new.library
    erb :'bookmarks/index'
  end

  run!if app_file == $0
end
