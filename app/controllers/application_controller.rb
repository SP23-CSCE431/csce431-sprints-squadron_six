class ApplicationController < ActionController::Base
  before_action :authenticate_authuser!
  helper_method :isadmin

  def isadmin
    @isadmin = current_authuser.admin
  end
end
