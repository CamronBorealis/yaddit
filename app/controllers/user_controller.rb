require_relative '../../core/app/actions/add_user'
require_relative '../../core/app/entities/entity_factory'
require_relative '../../core/external/bcrypt_plug'
require_relative '../../core/external/sample_user_jack'

class UserController < ApplicationController
  skip_before_filter :authenticate_user

  def create
  	action = AddUser.new(SampleUserJack.new, BCryptPlug.new, EntityFactory.new)
  	input = {:user=>params[:user]}
  	input[:user][:id] = Integer(input[:user][:id])
  	action.execute input

  	redirect_to '/messages/list'
  end

  def new
  	render 'new'
  end
end
