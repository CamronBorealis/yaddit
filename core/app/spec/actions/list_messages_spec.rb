require_relative '../../actions/list_messages'

describe ListMessages do
	before :each do
		@jack = double("MessageJackContract")
		@entity_factory = double("EntityFactory")
		@action = ListMessages.new @jack, @entity_factory
	end

	it 'should list all messages in the data store' do
		message_data = {:id=>1, :title=>"Title", :body=>"Body", :user_id=>1, :reply_to_message_id=>1}
		message_double = double("Message")
		message_double.should_receive(:to_hash).and_return(message_data)
		@entity_factory.should_receive(:generate_message).and_return(message_double)
		@jack.should_receive(:list_latest_root_messages).with(1).and_return(
		{
			:messages=>[message_data],
			:users=>[{:id=>1, :first_name=>"F", :last_name=>"L"}],
			:last_seen=>[{:message_id=>1}]
		})
		
		result = @action.execute 1
		result[:messages].count.should eq 1
		result[:messages][0].should eq message_data
		result[:users][0].should eq :id=>1, :first_name=>"F", :last_name=>"L"
		result[:last_seen].count.should eq 1
	end

end
        