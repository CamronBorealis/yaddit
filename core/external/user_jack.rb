require_relative '../app/contracts/user_jack_contract'

class UserJack < UserJackContract
	def get_by_email email
		users = UserModel.where(:email=>email).collect{|item| item.attributes.symbolize_keys}

		{
			:user => users.first
		}
	end

	def create input
		user = UserModel.new input
		user.save
	end
end