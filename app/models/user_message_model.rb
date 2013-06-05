class UserMessageModel < ActiveRecord::Base
  self.table_name = "user_messages"
  attr_accessible :message_id, :user_id, :last_seen
end
