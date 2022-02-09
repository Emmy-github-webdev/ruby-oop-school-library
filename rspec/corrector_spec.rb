require 'rspec'
require_relative '../classes/corrector'
require_relative '../classes/student'

describe Corrector do
  before :all do
    @corrector = Corrector.new
  end

  it 'Should capitalize the first letter of a name' do
    student = Student.new(2, 'emmanuel')
    expect(@corrector.correct_name(student.name)).to eq 'Emmanuel'
  end
end
