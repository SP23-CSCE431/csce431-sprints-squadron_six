require 'rails_helper'

RSpec.describe Exam, type: :model do

    subject {
        described_class.new(exam_date: Date.today + 1.week)
    }

    it "is not valid without a date" do
        subject.exam_date = nil
        expect(subject).to_not be_valid
    end

    describe 'relationships' do
        it { should belong_to :course }
    end

    describe 'relationships' do
        it { should have_many :performance }
    end

end