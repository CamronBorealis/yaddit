require_relative '../../core/app/actions/add_user'
require_relative '../../core/app/entities/entity_factory'
require_relative '../../core/external/bcrypt_plug'
require_relative '../../core/external/user_jack'

class UserController < ApplicationController
  skip_before_filter :authenticate_user

  def create
    begin
    	action = AddUser.new(UserJack.new, BCryptPlug.new, EntityFactory.new)
    	input = {:user=>params[:user]}
    	input[:user][:id] = -1
    	action.execute input

    	redirect_to '/messages/list'
    rescue => e
      flash[:error] = "Error occured: " + e.message
      render 'new'
    end
  end

  def new
  	render 'new'
  end
end
