require 'rails_helper'

RSpec.describe Performance, type: :model do
  describe 'relationship' do
    it { should belong_to :user }
  end

  describe 'relationship' do
    it { should belong_to :exam }
  end
end
