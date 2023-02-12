class Alumni < ApplicationRecord
    validates :ID, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :graduation_year, presence: true
    validates :company, presence: true
end
