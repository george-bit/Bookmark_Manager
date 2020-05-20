feature 'Add a new bookmark' do
  scenario 'Adding a bookmark to the existing list' do
    visit('/add_bookmark')
    fill_in :url, with:'askjeeves.com'
    fill_in :title, with: 'Test Bookmark'
    click_button 'Add Bookmark'
    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end
end
