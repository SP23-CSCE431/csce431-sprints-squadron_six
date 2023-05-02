class Alumni < ApplicationRecord
  belongs_to :company
  belongs_to :user

  # validate that all parameters are inputted
  validates_presence_of :company_id
  validates_presence_of :user_id
  # a company can't be created that already exists
  # validates_uniqueness_of:company_id

  def self.search(search)
    where("CONCAT(users.user_fname, ' ', users.user_lname) ILIKE ?", "%#{search}%").joins(:user)
  end

  #  def company_with_location
  #   "#{company.company_name} - #{company.company_location}"
  #  end
end
