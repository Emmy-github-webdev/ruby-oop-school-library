class Person
  attr_writer :id
  attr_accessor :name, :age
  
  def initialize(age, name: 'Unkown',  parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

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
   print  @age
  end

  def can_use_services?
    age >= 18 || parent_permission == true ? true : false
  end

  private

  def is_of_age?
    age >= 18 ? true : false
  end

end

person1 = Person.new(20)
