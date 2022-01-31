class Person
  
  def initialize(name = "Unkown", age, parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  @id
  @name
  @age

  #Setter
  def name=(name)
    @name = name
  end

  def age=(age)
    @name = name
  end

  #getter
  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  def to_s
    "Hello! My name is #{@name}, and I'm #{age} years old."
  end
end

person1 = Person.new
person1.name = "Emmanuel"
puts person1.name