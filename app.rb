require './book'
require './classroom'
require './corrector'
require './person'
require './rental'
require './student'
require './teacher'

class App
  attr_accessor :books, :people

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def choose_a_number
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    action_based_on_number_choosed = get.chomp
    choose_a_number action_based_on_number_choosed
  end

  def action_based_on_number_choosed(option)
    case option
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_a_person
    when '4'
      create_a_book
    when '5'
      create_a_rental
    when '6'
      list_all_rentals_for_a_person
    else
      exit
    end
  end

  def list_all_books
    @books.each do |book|
      puts "Title: #{book.title}, #{book.author}"
      puts 'List of Books'
    end
  end

  def list_all_people
    @people.each do |person|
      puts "Name: #{person.Name}, Age: #{person.age}, Parent permission: #{person.parent_permission}"
      puts 'List of People'
    end
  end

  def create_a_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    input = gets.chomp
    case input
    when '1'
      create_a_student
    when '2'
      create_a_teacher
    else
      exit
    end
  end

  def create_a_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print "#{name} has parent permission? [Y/N]: "
    has_permission = gets.chomp.downcase == 'y'
    student = Student.new(classroom: @classroom, age: age, name: name, parent_permission: has_permission)
    @people.push(student)
    puts 'Student created successfully'
    puts
    choose_a_number
  end

  def create_a_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age: age, name: name, specialization: specialization)
    @people.push(teacher)
    puts 'Teacher created successfully'
    puts
    choose_a_number
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author'
    author = gets.chomp
    book = Book.new(title, author)
    @book.push(book)
    puts 'Book cretaed successfully'
    puts
    choose_a_number
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    @books.each_with_number do |book, number|
      puts "#{number} #{book.title} #{book.author}"
    end
    book_number = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_number do |person, number|
      puts "#{number} #{person.name} #{person.age}"
    end
    person_number = gets.chomp.to_i
    puts
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[book_number], @people[person_number])
    @rentals.push(rental)

    puts 'Rental created successfully!'
    choose_a_number
    puts
  end

  def list_all_rentals_for_a_person
    print "Person's Id: "
    id = gets.chomp.to_i
    puts 'Rentals: '
    @rentals.each do |rental|
      puts "Date: #{rental.date}, #{rental.book.title}, #{rental.book.author}" if rental.id = id
    end
    choose_a_number
    puts
  end
end

