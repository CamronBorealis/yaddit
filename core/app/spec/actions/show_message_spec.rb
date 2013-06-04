require_relative '../../actions/show_message'
require_relative '../../entities/entity_factory'

describe ShowMessage do
	before :each do
		@message_jack = double("MessageJackContract")
		@user_message_jack = double("UserMessageJackContract")
		@entity_factory = double("EntityFactory")
		@action = ShowMessage.new @message_jack, @user_message_jack, @entity_factory
	end

	it 'should show message for given id with replies and users' do
		message_data = {
			:messages=>[
				{:id=>1, :title=>"First!", :body=>"Oh, man, totally got it", :user_id=>1, :reply_to_message_id=>nil}
			],
			:users=>[
				{:id=>1, :first_name=>"F1", :last_name=>"L1", :email=>"test@1.com"}
			]
		}
		@message_jack.should_receive(:get_message_by_id_with_replies).with(1).and_return(message_data)
		messageA = double("Message")
		messageA.should_receive("to_hash").and_return(message_data[:messages][0])
		@entity_factory.should_receive(:generate_message).with(message_data[:messages][0]).and_return(messageA)
		@user_message_jack.stub(:update_message_timestamp)

		result = @action.execute({:message_id=>1, :user_id=>5})
		result[:messages].count.should eq 1
		result[:users].count.should eq 1
	end

	it 'should update timestamp on retrieval' do
		message_data = {
			:messages=>[
				{:id=>1, :title=>"First!", :body=>"Oh, man, totally got it", :user_id=>1, :reply_to_message_id=>nil}
			],
			:users=>[
				{:id=>1, :first_name=>"F1", :last_name=>"L1", :email=>"test@1.com"}
			]
		}
		@message_jack.stub(:get_message_by_id_with_replies).with(1).and_return(message_data)
		messageA = double("Message")
		messageA.stub("to_hash").and_return(message_data[:messages][0])
		@entity_factory.stub(:generate_message).with(message_data[:messages][0]).and_return(messageA)
		@user_message_jack.should_receive(:update_message_timestamp).with(1,5)

		result = @action.execute({:message_id=>1, :user_id=>5})
	end
end