class Company < ApplicationRecord
    validates_presence_of :company_name
    validates_presence_of :company_location
    validates_presence_of :company_industry
end
