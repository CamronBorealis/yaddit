require_relative './user'

class EntityFactory
	def generate_user input
		user = User.new
		user.populate input
		user
	end
end