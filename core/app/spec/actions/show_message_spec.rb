require_relative '../../actions/show_message'

describe ShowMessage do
	before :each do
		@plug = double("MessageJackContract")
		@entity_factory = double("EntityFactory")
		@action = ShowMessage.new @plug, @entity_factory
	end

	it 'should show message for given id' do
		message_data = {
			:messages=>[
				{:id=>1, :title=>"First!", :body=>"Oh, man, totally got it", :user_id=>1, :reply_to_message_id=>nil},
				{:id=>2, :title=>"Dang...", :body=>"Missed it :(", :user_id=>2, :reply_to_message_id=>1}
			],
			:users=>[
				{:id=>1, :first_name=>"F1", :last_name=>"L1", :email=>"test@1.com"},
				{:id=>2, :first_name=>"F2", :last_name=>"L2", :email=>"test@2.com"}
			]
		}
		@plug.should_receive(:get_message_by_id_with_replies).with(1).and_return(message_data)
		messageA = double("Message")
		messageA.should_receive("to_hash").and_return(message_data[:messages][0])
		messageB = double("Message")
		messageB.should_receive("to_hash").and_return(message_data[:messages][1])
		@entity_factory.should_receive(:generate_message).with(message_data[:messages][0]).and_return(messageA)
		@entity_factory.should_receive(:generate_message).with(message_data[:messages][1]).and_return(messageB)

		result = @action.execute :id=>1
		result[:messages].count.should eq 2	
		result[:users].count.should eq 2	
	end
end