require_relative '../entities/message'

class ReplyToMessage
	def initialize message_jack, entity_factory
		@message_jack = message_jack	
		@entity_factory = entity_factory
	end

	def execute input
		message_data = input[:message]

		message = @entity_factory.generate_message message_data
		@message_jack.create message.to_hash
	end
end