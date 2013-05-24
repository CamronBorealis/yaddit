class MessageModel < ActiveRecord::Base
	self.table_name = "messages"
  attr_accessible :body, :reply_to_message_id, :title, :user_id, :root_message_id
end
