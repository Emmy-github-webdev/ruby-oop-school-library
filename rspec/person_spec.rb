require 'rspec'
require_relative '../classes/person'

describe Person do
  context 'Testing person class' do
    it 'A person should have age' do
      person = Person.new(18)
      person_info = [!person.id.nil?, person.age, person.name, person.parent_permission]
      expect(person_info).to eq [true, 18, 'Unkown', true]
    end
  end
end
