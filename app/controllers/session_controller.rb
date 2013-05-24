require_relative '../../core/app/actions/authenticate_user'
require_relative '../../core/app/entities/entity_factory'
require_relative '../../core/external/bcrypt_plug'
require_relative '../../core/external/user_jack'

class SessionController < ApplicationController
	skip_before_filter :authenticate_user

  def create
  	action = AuthenticateUser.new UserJack.new, EntityFactory.new, BCryptPlug.new
  	input = {:credentials=>params[:credentials]}
  	user_id = action.execute input

  	if user_id == nil
      flash[:error] = "That username/password combination is invalid"
  		render 'log_in'
  	else
  		session[:user_id] = user_id
  		redirect_to "/messages/list"
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/session/log_in'
  end

  def log_in
  	render 'log_in'
  end
end
