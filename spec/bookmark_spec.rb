require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.makersacademy.com');")
connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.tutorialspoint.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("https://www.makersacademy.com")
      expect(bookmarks).to include("http://www.tutorialspoint.com")
    end
  end
end
