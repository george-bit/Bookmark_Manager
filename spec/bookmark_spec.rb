require 'bookmark'

describe Bookmark do
  describe '.library' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.new.library

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end
end
