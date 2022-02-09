require_relative 'input_output'

class PeopleCreation
  def initialize
    @io_data = IO.new
    @people = @IO.read_people
  end

  attr_reader :people

  def people_lists
    @people.each_with_index do |person, i|
      print "#{i}- "
      print person.is_a?(Student) ? '[Student]' : '[Teacher]'
      puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_student(age, name)
    print 'Do sutent has parent permission? [Y/N]'
    parent_permission = gets.chomp.downcase == 'y'
    classroom = Classroom.new('Room 1A')
    @people << Student.new(age, name, classroom, parent_permission: parent_permission)
  end

  def create_teacher(age, name)
    print 'specialization: '
    specialization = gets.chomp

    @people << Teacher.new(specialization, age, name)
  end

  def create_person
    puts 'Do you want to create a student (1) or teacher (2)? [Input the number]: )'
    user_option = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    user_option == '1' ? create_student(age, name) : create_teacher(age, name)

    puts "#{name} created successfully"
  end
end

class BookCreation
  def initialize
    @io_data = IO.new
    @books = @io_data.read_books
  end

  attr_reader :books

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    newbook = Book.new(title, author)
    @books.push(newbook)
    puts "#{title} created successfully"
  end

  def list_books
    @books.each_with_index do |book, i|
      puts "#{i}- Title: #{book.title}, Author: #{book.author}"
    end
  end
end

class RentalCreation
  def initialize(books, people)
    @io_data = IO.new
    @books = books
    @people = people
    @rentals = @io_data.read_rentals
    @book_input = nil
    @person_input = nil
  end

  attr_reader :rentals

  def for_book_input
    puts 'Select a book from the list of books below, enter the number: '
    @books.list_books
    user_book_input = gets.chomp.to_i
    @book_input = user_book_input < @books.books.length ? @books.books[user_book_input] : ''
  end

  def for_person_input
    puts 'Select a person from the list of persons below, enter the number: '
    @people.people_lists
    user_person_input = gets.chomp.to_i

    if user_person_input < @people.people.length
      @person_input = @people.people[user_person_input]
    else
      puts 'Incorrect selection'
    end
  end

  def create_rental
    puts 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @book_input, @person_input) unless @person_input.nil?
    puts 'Rentals created successfully'
  end

  def list_rentals_for_a_given_person
    puts 'List of persons with IDs'
    @people.people_lists
    puts 'Select ID of the person: '
    person_id = gets.chomp.to_i

    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
    end
  end

  def create_rental_handler
    for_book_input
    for_person_input
    create_rental
  end
end

class NoteOperation
  def initialize
    @add_book = BookCreation.new
    @add_people = PeopleCreation.new
    @add_rentals = RentalCreation.new(@add_book, @add_people)
    @io_data = IO.new(@add_book, @add_people, @add_rentals)
  end

  def operation_person(user_input)
    if user_input > 2
      user_input.odd? ? @add_book.create_book : @add_people.create_person
    elsif user_input.odd?
      @add_book.list_books
    else
      @add_people.people_lists
    end
  end

  def operation_rentals(user_input)
    user_input == 5 ? @add_rentals.create_rental_handler : @add_rentals.list_rentals_for_a_given_person
  end

  def exit_operation(user_input)
    if user_input == 7
      @io_data.save_data
      puts 'Exiting...'
    else
      puts 'Incorrect selection'
    end
  end
end

class DisplayMenuOptions
  def initialize
    @choices = ['List all books', 'List all people', 'Create a book', 'Create a person', 'Create a rental',
                'List all rentals for a person', 'Exit']
    @noteoperation = NoteOperation.new
  end

  def menu
    puts 'Please choose an option by entering a nunber: '
    @choices.each_with_index { |choice, i| puts "#{i + 1}. #{choice}" }
  end

  def option(user_choice)
    case user_choice
    when 1, 2, 3, 4
      @noteoperation.operation_person(user_choice)
    when 5, 6
      @noteoperation.operation_rentals(user_choice)
    else
      @noteoperation.exit_operation(user_choice)
    end
  end
end
