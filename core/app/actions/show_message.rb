require_relative '../entities/message'

class ShowMessage

	def initialize message_jack, user_message_jack, entity_factory
		@message_jack = message_jack
		@user_message_jack = user_message_jack
		@entity_factory = entity_factory
	end

	def execute input
		data = @message_jack.get_message_by_id_with_replies(input[:message_id])

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

	    @user_message_jack.update_message_timestamp input[:message_id], input[:user_id]
	    	
	    {
	      :messages=>messages,
	      :users=>users
	    }
	end
end