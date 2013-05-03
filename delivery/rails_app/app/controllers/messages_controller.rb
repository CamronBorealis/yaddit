require_relative '../../../../app/actions/list_messages'

require_relative '../../../../external/sample_message_plug'

class MessagesController < ApplicationController
  def list
  	action = ListMessages.new SampleMessagePlug.new
  	@messages = action.execute
  end
end