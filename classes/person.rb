require_relative 'corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id, :rentals, :parent_permission

  def initialize(age, name = 'Unkown', id = 'auto', parent_permission: true)
    @id = id == 'auto' ? Random.rand(1..1000) : id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    @first_leter_capital = Corrector.new
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name(name)
    @name = @first_leter_capital.correct_name(name)
  end

  private

  def of_age?
    age >= 18
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end
end
