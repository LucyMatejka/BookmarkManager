require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
  bookmarks = [
            "http://www.makersacademy.com",
            "https://www.tutorialspoint.com"
           ]

  bookmarks.join
end

  run! if app_file == $0
end
