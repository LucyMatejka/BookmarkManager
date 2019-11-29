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

post '/bookmarks/new' do
  Bookmark.create(url: params[:url], title: params[:title])
  redirect '/bookmarks'
end
#changed direction at Stage 11
  run! if app_file == $0
end
