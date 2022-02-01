require './corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unkown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
    @first_leter_capital = Corrector.new
  end

  def can_use_services?
    of_age? || @parent_permission == true
  end

  def validate_name
    @name = @first_leter_capital.correct_name(@name)
  end

  private

  def of_age?
    age >= 18
  end
end
