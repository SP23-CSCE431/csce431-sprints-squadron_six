class Alumni < ApplicationRecord
  belongs_to :company
  belongs_to :user

   # validate that all parameters are inputted
   validates_presence_of:company_id
   validates_presence_of:user_id
   validates_presence_of:created_at
   validates_presence_of:updated_at
   # a course can't be created that already exists
   validates_uniqueness_of:company_id
end
