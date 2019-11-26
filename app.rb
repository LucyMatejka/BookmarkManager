require 'sinatra/base'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
  @bookmarks = Bookmark.all
  erb :bookmarks
end

  run! if app_file == $0
end
