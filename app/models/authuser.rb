class Authuser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable,
         :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         omniauth_providers: [:google_oauth2]
  has_one :user
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |authuser|
      authuser.email = auth.info.email
      authuser.password = Devise.friendly_token[0, 20]
      authuser.full_name = auth.info.name # assuming the user model has a name
      authuser.avatar_url = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!

      # Build a new user record associated with the new authuser record
      authuser.build_user(
        user_fname: auth.info.first_name,
        user_lname: auth.info.last_name,
        user_email: auth.info.email
      )

      # Save both records
      authuser.save
    end
  end
end
