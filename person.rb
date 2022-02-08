require './corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id, :rentals, :parent_permission

  def initialize(age, name = 'Unkown', id = 'auto', parent_permission: true)
    @id = id == 'auto' ? Random.rand(1..1000) : id
    @name = name
    @parent_permission = parent_permission
    @age = age
    @rentals = []
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
