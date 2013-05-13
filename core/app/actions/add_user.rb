class AddUser
	def initialize plug, encryptor, entity_factory
		@plug = plug
		@encryptor = encryptor
		@entity_factory = entity_factory
	end

	def execute input
		user = @entity_factory.generate_user input
		user.encrypt_password @encryptor
		@plug.create user.to_hash
	end
end