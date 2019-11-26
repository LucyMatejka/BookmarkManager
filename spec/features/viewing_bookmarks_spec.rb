feature 'Viewing bookmarks' do
  scenario 'a user can see bookmarks' do
    visit('/bookmarks')

    expect(page).to have_content "https://www.makersacademy.com"
    expect(page).to have_content "http://www.tutorialspoint.com"
  end
end
