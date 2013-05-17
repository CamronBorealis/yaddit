class SampleMessageJack
	def initialize plug_type = nil
		@messages = [
			{:id=>1, :title=>"First!", :body=>"Oh, man, totally got it", :user_id=>1, :reply_to_message_id=>nil},
			{:id=>2, :title=>"Dang...", :body=>"Missed it :(", :user_id=>2, :reply_to_message_id=>1}
		]
	end

	def list
		@messages
	end

	def get_by_id id
		@messages.first
	end

	def create input
		1
	end
end