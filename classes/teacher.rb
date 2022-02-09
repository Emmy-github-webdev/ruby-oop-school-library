require_relative 'person'

class Teacher < Person
  attr_reader :specialization, :age

  def initialize(specialization, age, name, id = 'auto')
    super(age, name, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
