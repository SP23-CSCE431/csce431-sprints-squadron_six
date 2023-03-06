require 'rails_helper'

RSpec.describe Course, type: :model do
    
    subject {
        described_class.new(course_name: "Course",
                            course_hours: 1)
    }

    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

    it "is not valid without a name" do
        subject.course_name = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without hours" do
        subject.course_hours = nil
        expect(subject).to_not be_valid
    end

    describe 'relationships' do
        it { should have_many :exam}
    end

end