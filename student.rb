require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unkown', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def student=(student)
    @student = student
    student.students.push(self) unless student.students.include?(self)
  end
end
