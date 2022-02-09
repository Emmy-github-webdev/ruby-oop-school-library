class AppIO
  def initialize(add_book = {}, add_people = {}, add_rentals = {})
    @book_array = []
    @people_array = []
    @rentals_array = []
    @add_book = add_book
    @add_people = add_people
    @add_rentals = add_rentals
  end

  def save_data_to_file
    add_new_book
    add_new_rentals
    add_new_people
  end

  def fetch_books
    books = []
    return [] unless File.exist?('./data/book.json')

    book_array = JSON.parse(File.read('./data/book.json'))
    book_array.each { |book_items| books << Book.new(book_items['title'], book_items['author']) }
    books
  end

  def create_people(person)
    if person['specialization']
      Teacher.new(person['specialization'], person['name'], person['age'], person['id'])
    else
      Student.new(person['age'], person['name'], person['classroom'], person['id'],
                  parent_permission: person['parent_permission'])
    end
  end

  def fetch_people
    people = []
    return [] unless File.exist?('./data/people.json')

    people_array = JSON.parse(File.read('./data/people.json'))
    people_array.each do |person|
      people << create_people(person)
    end
    people
  end

  def fetch_rentals
    rentals = []
    return [] unless File.exist?('./data/rentals.json')

    rentals_array = JSON.parse(File.read('./data/rentals.json'))
    rentals_array.each do |rental|
      book, person = rental.values_at('book', 'person')
      rentals << Rental.new(rental['date'], Book.new(book['title'], book['author']),
                            create_people(person))
    end
    rentals
  end

  private

  def add_new_people
    @add_people.people.each do |person|
      person.is_a?(Student) ? add_new_student(person) : add_new_teacher(person)
    end
    File.write('./data/people.json', JSON.dump(@people_array))
  end

  def add_new_student(person)
    @people_array << {
      'id' => person.id,
      'age' => person.age,
      'name' => person.name,
      'classroom' => person.classroom,
      'parent_permission' => person.parent_permission
    }
  end

  def add_new_teacher(person)
    @people_array << {
      'id' => person.id,
      'specialization' => person.specialization,
      'name' => person.name,
      'age' => person.age
    }
  end

  def add_new_book
    @add_book.books.each { |book| @book_array << { 'title' => book.title, 'author' => book.author } }
    File.write('./data/book.json', JSON.dump(@book_array))
  end

  def add_new_rentals
    @add_rentals.rentals.each do |rental|
      @rentals_array << {
        'date' => rental.date,
        'book' => { 'title' => rental.book.title, 'author' => rental.book.author },
        'person' => rental.person.is_a?(Teacher) ? rental_teacher(rental) : rental_student(rental)
      }
    end
    File.write('./data/rentals.json', JSON.dump(@rentals_array))
  end

  def rental_student(rental)
    {
      'id' => rental.person.id,
      'age' => rental.person.age,
      'name' => rental.person.name,
      'parent_permission' => rental.person.parent_permission
    }
  end

  def rental_teacher(rental)
    {
      'id' => rental.person.id,
      'age' => rental.person.age,
      'name' => rental.person.name,
      'specialization' => rental.person.specialization
    }
  end
end
