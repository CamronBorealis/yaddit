require_relative '../app/contracts/user_message_jack_contract'

class UserMessageJack < UserMessageJackContract
	def update_message_timestamp message_id, user_id
		UserMessageModel.where(:message_id=>message_id, :user_id=>user_id).first_or_create.update_attributes(:last_seen => DateTime.now)
	end
end