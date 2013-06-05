require_relative '../entities/message'
require_relative '../entities/user'

class ListMessages

  def initialize message_jack, entity_factory
    @message_jack = message_jack
    @entity_factory = entity_factory
  end

  def execute user_id
    data = @message_jack.list_latest_root_messages user_id

    messages = []
    users = []
    last_seen = []
    last_activity = []

    data[:messages].each do |info|
      message = @entity_factory.generate_message info
      messages.push message.to_hash
    end

    data[:users].each do |info|
      user_data = {
        :id=>info[:id],
        :first_name=>info[:first_name],
        :last_name=>info[:last_name]
       }
      users.push user_data
    end

    data[:last_seen].each do |info|
      last_seen_data = {
        :message_id=>info[:message_id],
        :last_seen => info[:last_seen]
       }
      last_seen.push last_seen_data
    end

    data[:last_activity].each do |info|
      last_activity_data = {
        :message_id=>info[:message_id],
        :last_activity => info[:last_activity]
       }
      last_activity.push last_activity_data
    end
    
    {
      :messages=>messages,
      :users=>users,
      :last_seen=>last_seen,
      :last_activity=>last_activity
    }
    
  end
end
