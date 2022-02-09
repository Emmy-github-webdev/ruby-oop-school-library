require 'rspec'
require_relative '../classes/classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new('ogah')
  end

  context 'Testing classroom class'
  it 'Classroom should initialize without error' do
    expect(@classroom.label).to eq 'ogah'
  end

  it 'Create student without error' do
    student = Student.new(2, 'Emmanuel', @classroom)
    @classroom.add_student(student)

    expect(@classroom.student.length).to eq 2
  end
end
