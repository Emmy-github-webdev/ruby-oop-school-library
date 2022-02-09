require_relative 'person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(age, name, classroom = 'Room 1A', id: 'auto', parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
