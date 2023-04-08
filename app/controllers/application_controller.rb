class ApplicationController < ActionController::Base
  before_action :authenticate_authuser!
  helper_method :isadmin
  helper_method :user_info

  def isadmin
    @isadmin = current_authuser.admin
  end

  def user_info
    @user_email = current_authuser.email
  end
end
