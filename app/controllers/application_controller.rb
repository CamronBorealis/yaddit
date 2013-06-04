class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user

  def authenticate_user
  	if current_user_id == nil
  		redirect_to login_path
  	end
  end

  def current_user_id
  	session[:user_id]
  end
end
