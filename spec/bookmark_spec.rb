require 'bookmark'
#require 'database_helpers'

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

describe '.create' do
  it 'creates a new bookmark' do
    bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark').first

    expect(Bookmark['url']).to eq 'http://www.testbookmark.com'
    expect(Bookmark['title']).to eq 'Test Bookmark'
  end
end
