class User < ApplicationRecord
<<<<<<< HEAD
=======
    has_many :performance
    has_many :exam, through: :performance
    has_one :alumni

    validates_presence_of :user_fname
    validates_presence_of :user_lname
    validates_presence_of :user_email
    validates_presence_of :user_password
    validates_presence_of :user_grad_year

    validates_uniqueness_of :user_email

    validate :user_email_must_end_with_tamu_edu

    def user_email_must_end_with_tamu_edu
      unless user_email&.ends_with?("@tamu.edu")
        errors.add(:user_email, "must end with @tamu.edu")
      end
    end
>>>>>>> 3d282af (changed the frontend colors and added an additional test case for user)
end
