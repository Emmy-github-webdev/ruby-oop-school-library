class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unkown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  def can_use_services?
    age >= 18 || parent_permission == true
  end

  private

  def of_age?
    age >= 18
  end
end
