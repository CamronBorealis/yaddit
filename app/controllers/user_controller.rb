require_relative '../../core/app/actions/add_user'
require_relative '../../core/app/entities/entity_factory'
require_relative '../../core/external/bcrypt_plug'
require_relative '../../core/external/sample_user_plug'

class UserController < ApplicationController
  def create
  	action = AddUser.new(SampleUserPlug.new, BCryptPlug.new, EntityFactory.new)
  	input = params[:user]
  	input[:id] = Integer(input[:id])
  	p input
  	action.execute input

  	redirect_to list_messages_path
  end

  def new
  	render 'new'
  end
end
