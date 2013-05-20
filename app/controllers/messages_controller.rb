require_relative '../../core/app/actions/list_messages'
require_relative '../../core/app/actions/show_message'
require_relative '../../core/app/actions/add_message'
require_relative '../../core/external/sample_message_jack'
require_relative '../../core/app/entities/entity_factory'

class MessagesController < ApplicationController
  def list
  	action = ListMessages.new SampleMessageJack.new
  	@messages = action.execute

  	render 'list'
  end

  def show
  	action = ShowMessage.new SampleMessageJack.new
  	@message = action.execute params

  	render 'show'
  end

  def create
    action = AddMessage.new SampleMessageJack.new, EntityFactory.new
    input = {:message=>params[:message]}
    input[:message][:id] = -1
    input[:message][:user_id] = 1
    new_id = action.execute input

    redirect_to ('/messages/' + new_id.to_s)
  end

  def new
    render 'new'
  end

  def reply
    redirect_to ('/messages/' + params[:message][:reply_to_message_id])
  end
end
