require 'rails_helper'

# these are unit tests
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

    it "is not valid with negative hours" do
        subject.course_hours = -1
        expect(subject).to_not be_valid
    end

    it "is not valid with hours greater than 6" do
        subject.course_hours = 7
        expect(subject).to_not be_valid
    end

    it { should validate_uniqueness_of(:course_name) }

    describe 'relationships' do
        it { should have_many :exam}
    end

end