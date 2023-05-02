require 'rails_helper'

RSpec.describe(Exam, type: :model) do
  subject do
    course = Course.create(course_name: 'CSCE431', course_hours: 3)
    described_class.new(course_id: course.id, exam_date: Date.today + 1.week, exam_grade: 'A')
  end

  it 'is valid with valid attributes' do
    expect(subject).to(be_valid)
  end

  # course checking: should be a course that has been added to the system (available in dropdown)
  it 'is not valid without a course' do
    subject.course_id = nil
    expect(subject).to_not(be_valid)
  end

  # date checking: should be today or in the future

  # it "is not valid with a date in the past" do
  #     subject.exam_date = Date.today - 1.year
  #     if subject.exam_date < Date.today
  #       expect(subject).to_not be_valid
  #     end
  # end
  #
  # it "is valid with a date today or in the future" do
  #     if subject.exam_date >= Date.today
  #       expect(subject).to be_valid
  #     end
  # end

  it 'is not valid without a date' do
    subject.exam_date = nil
    expect(subject).to_not(be_valid)
  end

  # grade checking
  it 'is valid with no grade' do
    subject.exam_grade = nil
    expect(subject).to(be_valid)
  end

  # check for valid grade range w letter grading using ASCII comparisons
  it 'is valid with a positive grade between A-F' do
    expect(subject).to(be_valid) if subject.exam_grade >= 'A' && subject.exam_grade <= 'F'
  end

  # can't have an exam grade for a date in the future

  describe 'relationships' do
    it { should belong_to(:course) }
  end

  describe 'relationships' do
    it { should have_many(:performance) }
  end
end
