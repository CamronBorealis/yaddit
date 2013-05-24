class AddRootMessageIdToMessage < ActiveRecord::Migration
  def up
  	add_column :messages, :root_message_id, :integer
  end

  def down
  	remove_column :messages, :root_message_id
  end
end
