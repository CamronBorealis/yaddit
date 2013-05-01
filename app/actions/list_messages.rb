require_relative '../entities/message'

class ListMessages

  def initialize message_jack
    @message_jack = message_jack
  end

  def execute    
    # get the messages from the jack
    data = @message_jack.list
    
    # create/populate Message objects
    data.each do |info|
      message = Message.new
      message.populate info
    end
    
    # return the result
    data
    
  end
end
