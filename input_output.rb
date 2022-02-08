class IO
  def initialize(add_book = {}, add_people = {}, add_rentals = {})
    @book_array = []
    @people_array = []
    @rentals_array = []
    @add_book = add_book
    @add_people = add_people
    @add_rentals = add_rentals
  end

  def create_people(person)
    if person['specialization']
      Teacher.new(person['specialization'], person['name'], person['age'], person['id'])
    else
      Student.new(person['age'], person['name'], person['classroom'],
                  person['id'], parent_permission: person['parent_permission'])
    end
  end

  def add_new_book
    @add_book.books.each { |book| @book_array << { 'title' => book.title, 'author' => book.author } }
    File.write('data/book.json', JSON.dump(@book_array))
  end
end
