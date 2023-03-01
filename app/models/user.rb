class User < ApplicationRecord
    has_many :performance
    has_many :exam, through: :performance
    has_one :alumni

    validates_presence_of :user_fname
    validates_presence_of :user_lname
    validates_presence_of :user_email
    validates_presence_of :user_password
    validates_presence_of :user_grad_year
end
