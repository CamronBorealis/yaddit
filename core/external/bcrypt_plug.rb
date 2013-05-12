require_relative '../app/contracts/encryption_jack_contract'

class BCryptPlug < EncryptionJackContract
	def generate_salt
		BCrypt::Engine.generate_salt
	end

	def generate_hash password, salt
		BCrypt::Engine.hash_secret(password, salt)
	end
end