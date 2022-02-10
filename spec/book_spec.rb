require 'rspec'
require_relative '../classes/book'
require_relative '../classes/rental'
require_relative '../classes/student'

describe Book do
  before :each do
    book = Book.new('Chemistry', 'Osei Yaw Ababio')
    person = Student.new(30, 'Emmanuel Ogah')
    @rental = Rental.new('04/14/1986', book, person)
  end
  context 'Testing book class' do
    it 'A book should have a title and author' do
      book = Book.new('Title', 'Author')
      title = book.title
      author = book.author
      book_title_author = [title, author]

      expect(book_title_author).to eq %w[Title Author]
    end

    it 'Add rentals without error' do
      rental_info = [@rental.date, @rental.book.title, @rental.book.author, @rental.person.name]
      expect(rental_info).to eq ['04/14/1986', 'Chemistry', 'Osei Yaw Ababio', 'Emmanuel Ogah']
    end
  end
end
