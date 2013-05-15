class AddMessage
	def initialize plug, entity_factory
		@plug = plug
		@entity_factory = entity_factory
	end

	def execute input
		message = @entity_factory.generate_message input[:message]
		@plug.create message.to_hash
	end
end