feature 'Viewing bookmarks' do
  scenario 'a user can see bookmarks' do

Bookmark.create url: "https://www.makersacademy.com"
Bookmark.create url: "http://www.tutorialspoint.com"

    visit('/bookmarks')

    expect(page).to have_content "https://www.makersacademy.com"
    expect(page).to have_content "http://www.tutorialspoint.com"
  end
end
