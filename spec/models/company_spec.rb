require 'rails_helper'

RSpec.describe Company, type: :model do
  subject do
    described_class.new(company_name: 'Something',
                        company_location: 'State',
                        company_industry: 'Tech')
  end

  it 'is valid with all valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.company_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an location' do
    subject.company_location = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an industry' do
    subject.company_industry = nil
    expect(subject).to_not be_valid
  end

  #    it "is not valid with a duplicate name" do
  #        expect(comp).to_not be_valid
  #        expect(comp.errors[:company_name]).to include('has already been taken')
  #    end

  # describe 'name-location pairs should be unique' do
  #   it {
  #     should validate_uniqueness_of(:company_name).scoped_to(:company_location).with_message('has already been taken')
  #   }
  # end

  describe 'relationship' do
    it { should have_many :alumni }
  end
end
