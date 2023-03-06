class Alumni < ApplicationRecord
  belongs_to :company
  belongs_to :user

  validates_presence_of :company_id
  validates_presence_of :user_id

end
