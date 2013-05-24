class MessageJack
	# def initialize plug_type = nil
	# 	@plug = Sqlite3Plug.new
	# end

	def list
		messages = MessageModel.all.select{|item| item.attributes}
		users = UserModel.where(:id => messages.select{|message| message.user_id}).select{|item| item.attributes}

		{
			:messages => messages,
			:users => users
		}
	end

	def filter conditions
		MessageModel.where(conditions).select{|item| item.attributes}
	end

	def create input
		message = MessageModel.new input
		message.save

	end
end