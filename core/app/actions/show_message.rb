require_relative '../entities/message'

class ShowMessage

	def initialize message_jack, entity_factory
		@message_jack = message_jack
		@entity_factory = entity_factory
	end

	def execute input
		data = @message_jack.get_message_by_id_with_replies(input[:id])

	    messages = []
	    users = []

	    data[:messages].each do |info|
	      message = @entity_factory.generate_message info
	      messages.push message.to_hash
	    end

	    data[:users].each do |info|
	      user_data = {
	        :id=>info[:id],
	        :first_name=>info[:first_name],
	        :last_name=>info[:last_name]
	       }
	      users.push user_data
	    end
	    
	    {
	      :messages=>messages,
	      :users=>users
	    }
	end
end