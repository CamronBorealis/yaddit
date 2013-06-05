require_relative '../app/contracts/user_message_jack_contract'

class UserMessageJack < UserMessageJackContract
	def update_message_timestamp message_id, user_id
		item = UserMessageModel.where("message_id = ? and user_id = ?", message_id, user_id).first_or_create!
	end
end