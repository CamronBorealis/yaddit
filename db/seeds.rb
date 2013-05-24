# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = UserModel.create([{email: "test@test.com", first_name: "Camron", last_name: "Bute", password_hash: "$2a$10$pHl5Gax4WCfG3E5yV/peZ.K89/YnoigilwQzLmNQI8ycnCWPw1esa", password_salt: "$2a$10$pHl5Gax4WCfG3E5yV/peZ."},
	{email: "admin@test.com", first_name: "John", last_name: "Frank", password_hash: "$2a$10$pHl5Gax4WCfG3E5yV/peZ.K89/YnoigilwQzLmNQI8ycnCWPw1esa", password_salt: "$2a$10$pHl5Gax4WCfG3E5yV/peZ."}])
messages = MessageModel.create([{title: "First post", body: "This is the first post", user_id: 1},
	{body: "That's an honour", user_id: 2, reply_to_message_id: 1}])