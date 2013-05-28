require_relative '../entities/message'

class ReplyToMessage
	def initialize message_jack, entity_factory
		@message_jack = message_jack	
		@entity_factory = entity_factory
	end

	def execute input
		message_data = input[:message]

		parent_message = @message_jack.filter({:id=>message_data[:reply_to_message_id]})[:messages].first
		message_data[:root_message_id] = parent_message[:root_message_id] ||= parent_message[:id]

		message = @entity_factory.generate_message message_data
		@message_jack.create message.to_hash

		message_data[:root_message_id]
	end
end