class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def choose_a_number
    puts
    puts 'Please choose an option by entering a number:'
    puts
    puts '1 - List all books'
    puts
    puts '2 - List all people'
    puts
    puts '3 - Create a person'
    puts
    puts '4 - Create a book'
    puts
    puts '5 - Create a rental'
    puts
    puts '6 - List all rentals for a given person id'
    puts
    puts '7 - Exit'

  end
end

