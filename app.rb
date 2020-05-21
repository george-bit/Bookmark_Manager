require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    'Bookmark manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/add_bookmark' do
    erb :'bookmarks/add_bookmark'
  end

  post '/url' do
    session[:url] = params[:url]
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmark_added'
  end

  delete '/bookmark/:id' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("DELETE FROM bookmarks WHERE id = #{params['id']}")
  end

  get '/bookmark_added' do
    @bookmark = session[:url]
    erb :'bookmarks/bookmark_added'
  end

  run!if app_file == $0
end
