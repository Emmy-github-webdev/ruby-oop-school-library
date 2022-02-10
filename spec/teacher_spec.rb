require 'rspec'
require_relative '../classes/teacher'

describe Teacher do
  context 'Testing teacher class' do
    it 'A teacher should have a age, specialization and name' do
      teacher = Teacher.new('Age', 'Name', 'Specialization')
      age = teacher.age
      name = teacher.name
      specialization = teacher.specialization
      teacher_info = [specialization, age, name]

      expect(teacher_info).to eq %w[Age Name Specialization]
    end

    it 'can_use_services? should return true' do
      teacher = Teacher.new('Engineering', 'Oche', 100)
      expect(teacher.can_use_services?).to be true
    end
  end
end
