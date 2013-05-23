class Initial < ActiveRecord::Migration
  def up
  	create_table :users do |u|
  		u.string :first_name
  		u.string :last_name
  		u.string :email
  		u.string :password_salt
  		u.string :password_hash

      u.timestamps
  	end

  	create_table :messages do |m|
  		m.integer :user_id, :references => :users
  		m.string :title
  		m.string :body
  		m.integer :reply_to_message_id, :references => :messages

      m.timestamps
  	end
  end

  def down
  	drop_table :messages
  	drop_table :users
  end
end
