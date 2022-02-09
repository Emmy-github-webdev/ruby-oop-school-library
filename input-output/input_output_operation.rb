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
