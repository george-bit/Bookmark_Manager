feature 'Testing infrastructure' do
  scenario 'Testing infrastructure' do
    visit('/')
    expect(page).to have_content 'Bookmark manager'
  end
end
