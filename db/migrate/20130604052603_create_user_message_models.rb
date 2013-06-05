class CreateUserMessageModels < ActiveRecord::Migration
  def change
    create_table :user_messages do |t|
    	t.integer :message_id
    	t.integer :user_id
    	t.datetime :last_seen
    end
  end
end
