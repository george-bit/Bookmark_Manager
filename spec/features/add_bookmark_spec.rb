feature 'Add a new bookmark' do
  scenario 'Adding a bookmark to the existing list' do
    visit('/add_bookmark')
    fill_in :url, with:'askjeeves.com'
    click_button 'Add Bookmark'
    expect(page).to have_content 'You added askjeeves.com to your bookmarks'
  end
end
