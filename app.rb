require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    'Bookmark manager'
  end

  get '/bookmarks' do
    p ENV
    @bookmarks = Bookmark.new.library
    erb :'bookmarks/index'
  end

  get '/add_bookmark' do
    erb :'bookmarks/add_bookmark'
  end

  post '/url' do
    session[:url] = params[:url]
    Bookmark.new.create(params[:url])
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks (url) VALUES('#{session[:url]}');")
    redirect '/bookmark_added'
  end

  get '/bookmark_added' do
    @bookmark = session[:url]
    erb :'bookmarks/bookmark_added'
  end

  run!if app_file == $0
end
