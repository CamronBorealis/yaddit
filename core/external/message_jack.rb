require_relative '../app/contracts/message_jack_contract'

class MessageJack < MessageJackContract
	def list_latest_root_messages
		messages = MessageModel.where(:reply_to_message_id => nil).limit(50).select{|item| item.attributes}
		users = UserModel.where(:id => messages.select{|message| message.user_id}).select{|item| item.attributes}

		{
			:messages => messages,
			:users => users
		}
	end

	def filter conditions
		messages = MessageModel.where(conditions).select{|item| item.attributes}
		users = UserModel.where(:id => messages.select{|message| message.user_id}).select{|item| item.attributes}

		{
			:messages => messages,
			:users => users
		}
	end

	def get_message_by_id_with_replies id
		messages = MessageModel.where("id = ? OR root_message_id = ?", id, id).select{|item| item.attributes}
		users = UserModel.where(:id => messages.select{|message| message.user_id}).select{|item| item.attributes}

		{
			:messages => messages,
			:users => users
		}
	end

	def create input
		message = MessageModel.new input
		message.save
	end
end