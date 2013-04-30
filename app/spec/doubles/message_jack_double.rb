require_relative '../../contracts/message_jack_contract'

class MessageJackDouble
  def self.create behavior
    case behavior
    when :bad_output
      MessageJack_BadOutput.new
    when :default
      MessageJack_Default.new
    end
  end
end

class MessageJack_Default < MessageJackContract
  
  def list input
    {}
  end
    
end

class MessageJack_BadOutput < MessageJackContract
  
  def list input
    nil
  end
    
end
