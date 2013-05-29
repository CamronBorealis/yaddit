require_relative '../app/contracts/message_jack_contract'

class MessageJack < MessageJackContract
	def list_latest_root_messages
		messages = MessageModel.where(:root_message_id => nil).collect{|item| item.attributes.symbolize_keys}
		users = UserModel.where(:id=> messages.map{|message| message[:user_id]}).collect{|item| item.attributes.symbolize_keys}

		{
			:messages => messages,	
			:users => users
		}
	end

	def filter conditions
		messages = MessageModel.where(conditions).collect{|item| item.attributes}
		users = UserModel.where(:id=> messages.map{|message| message[:user_id]}).collect{|item| item.attributes.symbolize_keys}

		{
			:messages => messages,
			:users => users
		}
	end

	def get_message_by_id_with_replies id
		messages = MessageModel.where("id = ? OR root_message_id = ?", id, id).collect{|item| item.attributes.symbolize_keys}
		users = UserModel.where(:id=> messages.map{|message| message[:user_id]}).collect{|item| item.attributes.symbolize_keys}

		{
			:messages => messages,
			:users => users
		}
	end

	def create input
		message = MessageModel.new input
		message.save
		message.id
	end
end