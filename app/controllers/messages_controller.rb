require_relative '../../core/app/actions/list_messages'
require_relative '../../core/app/actions/show_message'
require_relative '../../core/external/sample_message_jack'

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
end
