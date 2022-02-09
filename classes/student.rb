require_relative 'person'
require 'json'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(age, name, classroom = 'Block', parent_permission: true, id: 'auto')
    @classroom = classroom
    super(age, name, id, parent_permission: parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
