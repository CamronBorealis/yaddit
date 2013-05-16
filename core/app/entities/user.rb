require 'validation'

class User
	include Validation

	attr_validator :id, Fixnum
	attr_validator :email, AND(String, NOT(""))
	attr_validator :password, AND(
		OR(String, nil),
		->password{ password == nil ? true : password.length > 0 }
		)
	attr_validator :password_confirmation, AND(
		OR(String, nil),
		 ->confirm{ self.password == nil && confirm == nil ? true : confirm == self.password }
		 )
	attr_validator :first_name, AND(String, NOT(""))
	attr_validator :last_name, AND(String, NOT(""))
	attr_reader :password_salt
	attr_reader :password_hash

	def self.shape
		{
			:id=> Fixnum,
			:email=>String,
			:password=>OR(String, nil),
			:password_confirmation=>OR(String, nil),
			:first_name=>String,
			:last_name=>String
		}
	end
  
	def populate input
		self.id = input[:id]
		self.email = input[:email]
		self.first_name = input[:first_name]
		self.last_name = input[:last_name]
		self.password = input[:password]
		self.password_confirmation = input[:password_confirmation]
		@password_salt = input[:password_salt]
		@password_hash = input[:password_hash]
	end

	def to_hash
		{
			:id => id,
			:email => email,
			:first_name => first_name,
			:last_name => last_name,
			:password_salt => password_salt,
			:password_hash => password_hash
		}
	end

	def encrypt_password encryptor
		if self.password != nil
			salt = encryptor.generate_salt
			hash = encryptor.generate_hash self.password, salt
			@password_salt = salt
			@password_hash = hash
		end
	end
end
