class Company < ApplicationRecord
    has_many :alumni

    # A name, location, and industry must be present
    validates_presence_of :company_name
    validates_presence_of :company_location
    validates_presence_of :company_industry

    # The user cannot enter a company name that already exists
    validates_uniqueness_of :company_name
end
