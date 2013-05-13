require_relative '../core/app/actions/add_user'
require_relative '../core/app/entities/entity_factory'
require_relative '../core/external/bcrypt_plug'
require_relative '../core/external/sample_user_plug'

class UserController < ApplicationController
  def create input
  	action = AddUser.new SampleUserPlug.new, BCryptPlug.new, EntityFactory.new
  	action.execute input

  	redirect_to list_messages_path
  end
end
