class AuthenticateUser
	def initialize jack, entity_factory, encryptor
		@jack = jack
		@entity_factory = entity_factory
		@encryptor = encryptor
	end

	def execute input
		credentials = input[:credentials]
		data = @jack.get_by_email credentials[:email]
		if data == nil
			nil
			result = "Denied"
		else
			user = @entity_factory.generate_user data[:user]
			hash = @encryptor.generate_hash credentials[:password], user.password_salt
			result = hash == user.password_hash ? "OK" : "Denied"
		end
		
		{:result=>result}
	end
end