require 'rspec'
require_relative '../classes/person'

describe Person do
  context 'Testing person class' do
    it 'A person should have age' do
      person = Person.new(18)
      person_info = [!person.id.nil?, person.age, person.name, person.parent_permission]
      expect(person_info).to eq [true, 18, 'Unkown', true]
    end
    it 'A person should be initailized by name, age, id' do
      id = rand(1..1000)
      person = Person.new(21, 'Emmanuel', id)
      person_info = [person.id, person.age, person.name, person.parent_permission]
      expect(person_info).to eq [id, 21, 'Emmanuel', true]
    end

    it 'Can_use_service? Check age is greater than 18 years' do
      person = Person.new(21)
      expect(person.can_use_services?).to be true
    end
  end
end
