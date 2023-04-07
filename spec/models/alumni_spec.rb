require 'rails_helper'

RSpec.describe Alumni, type: :model do
    subject {
        company1 = Company.create(company_name:"HP", company_location:"Houston", company_industry:"Softwares")
        company2 = Company.create(company_name:"Apple", company_location:"Houston", company_industry:"Softwares/Hardwares")
        described_class.new(company_id: company1.id, user_id: 123456)
    }
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end
    it "is not valid without a company" do
        subject.company_id = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a user" do
        subject.user_id = nil
        expect(subject).to_not be_valid
    end
    

    
    describe 'relationship' do
        it {should belong_to :company}
    end

    describe 'relationship' do
        it {should belong_to :user}
    end

end