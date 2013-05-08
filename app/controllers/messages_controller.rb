require_relative '../../core/app/actions/list_messages'
require_relative '../../core/external/sample_message_plug'

class MessagesController < ApplicationController
  def list
  	@messages = ListMessages.new SampleMessagePlug.new

  	render 'list'
  end
end
