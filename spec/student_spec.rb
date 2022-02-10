require 'rspec'
require_relative '../classes/student'

describe Student do
  context 'Testing student class' do
    it 'A student should have a age and name' do
      student = Student.new('Age', 'Name')
      age = student.age
      name = student.name
      student_info = [age, name]

      expect(student_info).to eq %w[Age Name]
    end

    it 'play_hooky should return  "¯\(ツ)/¯" without error' do
      student = Student.new(10, 'Ogah')
      expect(student.play_hooky).to eq "¯\(ツ)/¯"
    end
  end
end
