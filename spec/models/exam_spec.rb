require 'rails_helper'

RSpec.describe Exam, type: :model do

    subject {
        described_class.new(course_id: "course", exam_date: Date.today + 1.week, exam_grade:"A")
    }

    it "is not valid without a date" do
        subject.exam_date = nil
        expect(subject).to_not be_valid
    end

    it "is not valid with a date in the past" do
        if subject.exam_date < Date.today
          expect(subject).to_not be_valid
    end

    it "is not valid without a course" do
        subject.course_id = nil
        expect(subject).to_not be_valid
    end

    it "is valid with a date today or in the future" do
        if subject.exam_date >= Date.today
          expect(subject).to be_valid
    end

    it "is valid with no grade" do
      # if subject.exam_grade = nil
      #   expect(subject).to_not be_valid
      # end
    end

    it "is valid with a positive grade between 0-100" do
      # if subject.exam_grade >=0 && subject.exam_grade <=100
      #   expect(subject).to be_valid
      # end
    end

    describe 'relationships' do
        it { should belong_to :course }
    end

    describe 'relationships' do
        it { should have_many :performance }
    end

end
