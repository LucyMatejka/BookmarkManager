require 'bookmark'
#require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      #connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.makersacademy.com');")
      #connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.tutorialspoint.com');")
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.tutorialspoint.com", title: "Tutorials Point")
      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 2
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq("https://www.makersacademy.com")
    #  expect(bookmarks).to include("http://www.tutorialspoint.com")
    end
  end
end

describe '.create' do
  it 'creates a new bookmark' do
    bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
    persisted_data = persisted_data(id: bookmark.id)
    #persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data.first['id']
    expect(bookmark.title).to eq 'Test Bookmark'
    expect(bookmark.url).to eq 'http://www.testbookmark.com'
    #expect(Bookmark['url']).to eq 'http://www.testbookmark.com'
    #expect(Bookmark['title']).to eq 'Test Bookmark'
  end
end
