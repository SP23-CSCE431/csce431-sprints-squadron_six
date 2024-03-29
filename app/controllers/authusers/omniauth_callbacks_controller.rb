# frozen_string_literal: true

class Authusers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def google_oauth2
    authuser = Authuser.from_omniauth(auth)
    adminuser = Adminuser.find_by(email: auth.info.email)

    if authuser.persisted? && adminuser.present?
      authuser.update(
        admin: adminuser.isaadmin
        # add any other fields that you want to update
      )
    else
      authuser.save!
    end

    if authuser.present? && adminuser.present?
      # if authuser.present?
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      # redirect_to new_authuser_session_path unless adminuser

      sign_in_and_redirect authuser, event: :authentication
    else
      flash[:alert] = t 'devise.omniauth_callbacks.failure',
                        kind: 'Google',
                        reason: "#{auth.info.email} is not authorized."
      redirect_to new_authuser_session_path
    end

    # @authuser = Authuser.from_omniauth(request.env["omniauth.auth"])
    # if @authuser.persisted?
    #   sign_in_and_redirect @authuser, event: :authentication
    #   if is_navigational_format?
    #     set_flash_message(:notice, :success, kind: "Google")
    #   end
    # else
    #   redirect_to new_user_registration_url
    # end
  end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  protected

  def after_omniauth_failure_path_for(_scope)
    new_authuser_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  private

  # def from_google_params
  #   @from_google_params ||= {
  #     uid: auth.uid,
  #     email: auth.info.email,
  #     full_name: auth.info.name,
  #     avatar_url: auth.info.image
  #   }
  # end

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
