class App
  attr_accessor :books, :people, :rentals
  
  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
  end
end