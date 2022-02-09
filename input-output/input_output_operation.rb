require_relative 'input_output'

class PeopleCreation
  def initialize
    @io_data = IO.new
    @people = @IO.read_people
  end

  attr_reader :people

  def people_lists
    @people.each_with_index do |person, i|
      print "#{i} "
      print person.is_a?(Student) ? '[Student]' : '[Teacher]'
      puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_student(age, name)
    print 'Do sutent has parent permission? [Y/N]'
    parent_permission = gets.chomp.downcase == 'y'
  end
end