require_relative '../entities/message'

class ShowMessage

	def initialize message_jack
		@message_jack = message_jack
	end

	def execute input
		data = @message_jack.get_by_id input[:id]
		
		message = Message.new
		message.populate data

		message
	end
end