require 'rails_helper'

# these are unit tests
RSpec.describe Course, type: :model do
  subject do
    described_class.new(course_name: 'CSCE222',
                        course_hours: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.course_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without hours' do
    subject.course_hours = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with negative hours' do
    subject.course_hours = -1
    expect(subject).to_not be_valid
  end

  it 'is not valid with hours greater than 6' do
    subject.course_hours = 7
    expect(subject).to_not be_valid
  end

  it 'is not valid with too long of a course name' do
    subject.course_name = 'CSCE 222'
  end

  it 'is not valid with too short of a course name' do
    subject.course_name = 'course'
  end

  it { should validate_uniqueness_of(:course_name).case_insensitive }

  describe 'relationships' do
    it { should have_many :exam }
  end
end
