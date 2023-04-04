class Company < ApplicationRecord
    has_many :alumni

    # A name, location, and industry must be present
    validates_presence_of :company_name
    validates_presence_of :company_location
    validates_presence_of :company_industry

    # Company/location pairs must be unique
    # While the user can enter a company name that already exists, the location must be different
    # from what's already in the database
    validates :company_name, uniqueness: { scope: :company_location }

    # validates :company_name, presence: true, uniqueness: {case_sensitive: false}

    def self.search(search)
        where(['company_name ILIKE ?', "%#{search}%"])
    end

    def company_with_location
        "#{company_name} - #{company_location}"
    end

end
