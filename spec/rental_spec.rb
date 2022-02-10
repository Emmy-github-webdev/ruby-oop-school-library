require 'rspec'
require_relative '../classes/rental'
require_relative '../classes/student'
require_relative '../classes/book'

describe Rental do
  before :each do
    book = Book.new('Chemistry', 'Osei Yaw Ababio')
    person = Student.new(30, 'Emmanuel Ogah')
    @rental = Rental.new('04/14/1986', book, person)
  end

  context 'Check a person can rental a book' do
    it 'Rent a book without error' do
      rental_info = [@rental.date, @rental.book.title, @rental.book.author, @rental.person.name]
      expect(rental_info).to eq ['04/14/1986', 'Chemistry', 'Osei Yaw Ababio', 'Emmanuel Ogah']
    end
  end
end
