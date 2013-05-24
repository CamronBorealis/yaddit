require_relative '../../core/app/actions/list_messages'
require_relative '../../core/app/actions/show_message'
require_relative '../../core/app/actions/add_message'
require_relative '../../core/app/actions/reply_to_message'
require_relative '../../core/external/message_jack'
require_relative '../../core/app/entities/entity_factory'

class MessagesController < ApplicationController
  def list
  	action = ListMessages.new MessageJack.new, EntityFactory.new
  	data = action.execute
    @messages = data[:messages]
    @users = data[:users]

  	render 'list'
  end

  def show
  	action = ShowMessage.new MessageJack.new, EntityFactory.new
    input = {:id=>Integer(params[:id])}
    result = action.execute input
  	@messages = result[:messages]
    @message = @messages.select{|message_data| message_data[:id] == input[:id]}.first

  	render 'show'
  end

  def create
    begin    
      action = AddMessage.new MessageJack.new, EntityFactory.new
      input = {:message=>params[:message]}
      input[:message][:id] = -1
      input[:message][:user_id] = session[:user_id]
      new_id = action.execute input

      redirect_to ('/messages/' + new_id.to_s)
    rescue => e
      flash[:error] = "Error occured: " + e.message
      render 'new'
    end
  end

  def new
    render 'new'
  end

  def reply
    action = ReplyToMessage.new MessageJack.new, EntityFactory.new
    input = {:message=>params[:message]}
    input[:message][:id] = -1
    input[:message][:user_id] = session[:user_id]
    input[:message][:reply_to_message_id] = Integer(input[:message][:reply_to_message_id])
    action.execute input

    redirect_to ('/messages/' + params[:message][:reply_to_message_id].to_s)
  end
end
