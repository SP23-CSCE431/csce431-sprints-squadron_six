require 'rails_helper'

RSpec.describe User, type: :model do
    subject {
        described_class.new(user_fname: "Anything",
                           user_lname: "Something",
                           user_email: "something@gmail.com",
                           user_password: "password",
                           user_role: "some role",
                           user_grad_year: Date.today + 1.week,
                           user_points: 0)
    }

    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

    it "is not valid without a first name" do
        subject.user_fname = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a last name" do
        subject.user_lname = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
        subject.user_email = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
        subject.user_password = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a graduation year" do
        subject.user_grad_year = nil
        expect(subject).to_not be_valid
    end

    describe 'relationship' do
        it { should have_one :alumni}
    end

    describe 'relationship' do
        it { should have_many :performances}
    end

    describe 'relationship' do
        it { should have_many(:exams).through(:performance) }
    end
    
end