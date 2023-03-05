require 'rails_helper'

RSpec.describe Alumni, type: :model do

    describe 'relationship' do
        it {should belong_to :company}
    end

    describe 'relationship' do
        it {should belong_to :user}
    end

end