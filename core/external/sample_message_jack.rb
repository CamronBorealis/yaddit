class SampleMessageJack
	def initialize plug_type = nil
		@messages = {
			:messages=>[
				{:id=>1, :title=>"First!", :body=>"Oh, man, totally got it", :user_id=>1, :reply_to_message_id=>nil},
				{:id=>2, :title=>"Dang...", :body=>"Missed it :(", :user_id=>2, :reply_to_message_id=>1}
			],
			:users=>[
				{:id=>1, :first_name=>"F1", :last_name=>"L1", :email=>"test@1.com"},
				{:id=>2, :first_name=>"F2", :last_name=>"L2", :email=>"test@2.com"}
			]
		}
	end

	def list
		@messages
	end

	def get_by_id id
		@messages
	end

	def create input
		1
	end
end