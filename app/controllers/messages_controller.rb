require_relative '../../core/app/actions/list_messages'
require_relative '../../core/app/actions/show_message'
require_relative '../../core/app/actions/add_message'
require_relative '../../core/app/actions/reply_to_message'
require_relative '../../core/external/message_jack'
require_relative '../../core/external/user_message_jack'
require_relative '../../core/app/entities/entity_factory'

class MessagesController < ApplicationController
  def list
  	action = ListMessages.new MessageJack.new, EntityFactory.new
  	data = action.execute current_user_id
    @messages = data[:messages]
    @users = data[:users]

  	render 'list'
  end

  def show
  	begin
      action = ShowMessage.new MessageJack.new, UserMessageJack.new, EntityFactory.new
      input = {:message_id=>Integer(params[:id]), :user_id=>current_user_id}
      result = action.execute input

      @messages = result[:messages]
      @message = @messages.select{|message_data| message_data[:id] == input[:message_id]}.first
      @users = result[:users]

      render 'show'
    rescue => e
      flash[:error] = "Error occured: " + e.message
      p e.backtrace
      redirect_to messages_list_path
    end
  end

  def create
    begin    
      action = AddMessage.new MessageJack.new, EntityFactory.new
      input = {:message=>params[:message]}
      input[:message][:id] = -1
      input[:message][:user_id] = current_user_id
      new_id = action.execute input

      redirect_to messages_show_path(new_id)
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
    input[:message][:user_id] = current_user_id
    input[:message][:reply_to_message_id] = Integer(input[:message][:reply_to_message_id])
    new_id = action.execute input

    redirect_to messages_show_path(new_id)
  end
end
