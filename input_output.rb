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

  def save_people
    @add_people.people.each do |person|
      person.is_a?(student) ? add_new_student(person) : add_new_teacher(person)
    end
    File.write('data/people.json', JSON.dump(@people_array))
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
    File.write('data/book.json', JSON.dump(@book_array))
  end

  def add_new_rentals
    @add_rentals.rentals.each do |rental|
      @rentals_array << {
        'date' => rental.date,
        'book' => { 'title' => rental.book.title, 'author' => rental.book.author },
        'person' => rental.person.is_a?(Teacher) ? rental_teacher(rental) : rental_student(rental)
      }
    end
    File.write('data/rentals.json', JSON.dump(@rentals_array))
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
