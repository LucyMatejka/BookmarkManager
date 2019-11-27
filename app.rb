require 'sinatra/base'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    p ENV
  @bookmarks = Bookmark.all
  erb :bookmarks
end

get '/bookmarks/new' do
  erb :"bookmarks/new"
end
#changed quotation marks line 17 from w/through

post '/bookmarks' do
  Bookmark.create(url: params[:url])
  redirect '/bookmarks'
end

  run! if app_file == $0
end
