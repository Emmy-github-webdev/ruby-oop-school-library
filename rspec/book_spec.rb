require 'rspec'
require_relative '../classes/book'

describe Book do
  context 'Testing book class' do
    it 'A book should have a title and author' do
      book = Book.new('Title', 'Author')
      title = book.title
      author = book.author
      book_title_author = [title, author]

      expect(book_title_author).to eq %w[Title Author]
    end
  end
end
