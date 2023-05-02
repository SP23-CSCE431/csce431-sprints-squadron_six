class Company < ApplicationRecord
  has_many :alumni

  # A name, location, and industry must be present
  validates :company_name, presence: true
  validates :company_location, presence: true
  validates :company_industry, presence: true

  # Company name/location pairs must be unique
  # While the user can enter a company name that already exists, the location must be different
  # from what's already in the database
  # validates :company_name, uniqueness: { scope: :company_location, case_sensitive: false }
  validate :unique_name_and_location

  def unique_name_and_location
    if Company.where('company_name ILIKE ? AND company_location ILIKE ?', company_name, company_location).where.not(id: id).exists?
      errors.add(:base, 'A company with that name and location already exists')
    end

    errors.add(:base, 'A company with that name and location already exists')
  end

  def self.search(search)
    where(['company_name ILIKE ?', "%#{search}%"])
  end

  def company_with_location
    "#{company_name} - #{company_location}"
  end
end
