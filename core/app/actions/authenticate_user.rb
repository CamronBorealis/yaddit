class AuthenticateUser
	def initialize jack, entity_factory, encryptor
		@jack = jack
		@entity_factory = entity_factory
		@encryptor = encryptor
	end

	def execute input
		credentials = input[:credentials]
		data = @jack.get_by_email credentials[:email]
		p data
		user = @entity_factory.generate_user data
		hash = @encryptor.generate_hash credentials[:password], user.password_salt
		result = hash == user.password_hash ? "OK" : "Denied"
		{:result=>result}
	end
end