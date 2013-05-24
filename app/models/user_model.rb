class UserModel < ActiveRecord::Base
	self.table_name = "users"
  attr_accessible :email, :first_name, :last_name, :password_salt, :password_hash
end
