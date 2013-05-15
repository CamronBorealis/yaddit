require_relative './user'
require_relative './message'

class EntityFactory
	def generate_user input
		user = User.new
		user.populate input
		user
	end

	def generate_message input
		message = Message.new
		message.populate input
		message
	end
end