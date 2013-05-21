class Initial < ActiveRecord::Migration
  def up
  	create_table :users do |u|
  		u.string :first_name
  		u.string :last_name
  		u.string :email
  		u.string :password_salt
  		u.string :password_hash
  	end

  	create_table :messages do |m|
  		m.integer :user_id, :references => :users
  		m.string :title
  		m.string :body
  		m.integer :reply_to_message_id
  	end
  end

  def down
  end
end
