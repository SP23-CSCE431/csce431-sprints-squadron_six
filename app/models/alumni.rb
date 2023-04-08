class Alumni < ApplicationRecord
  belongs_to :company
  belongs_to :user

   # validate that all parameters are inputted
   validates_presence_of:company_id
   validates_presence_of:user_id
   # a company can't be created that already exists
   # validates_uniqueness_of:company_id
   def self.search(search)
    where(['users.user_lname ILIKE ?', "%#{search}%"]).joins(:user)
  end
end
