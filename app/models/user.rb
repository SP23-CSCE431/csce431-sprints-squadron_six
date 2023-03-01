class User < ApplicationRecord
    validates_presence_of :user_fname
    validates_presence_of :user_lname
    validates_presence_of :user_email
    validates_presence_of :user_password
    validates_presence_of :user_grad_year
end
