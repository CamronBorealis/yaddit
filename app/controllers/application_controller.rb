class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user

  def authenticate_user
  	if session[:user_id] == nil
  		redirect_to "/session/log_in"
  	else

  	end
  end
end
