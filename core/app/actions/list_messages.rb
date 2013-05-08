require_relative '../entities/message'

class ListMessages

  def initialize message_jack
    @message_jack = message_jack
  end

  def execute
    # get the messages from the jack
    data = @message_jack.list

    messages = []
    
    # create/populate Message objects
    data.each do |info|
      message = Message.new
      message.populate info
      messages.push message
    end
    
    # return the result
    messages
    
  end
end
