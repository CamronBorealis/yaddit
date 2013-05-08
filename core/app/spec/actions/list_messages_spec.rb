require_relative '../../actions/list_messages'

describe ListMessages do
	before :each do
		@plug = double("MessageJackContract")
		@action = ListMessages.new @plug
	end

	it 'should list all messages in the data store' do
		@plug.stub(:list){[{:id=>1, :title=>"Title", :body=>"Body", :user_id=>1, :reply_to_message_id=>1}]}
		
		result = @action.execute
		result.count.should eq 1
		result.first.to_hash.should eq :id=>1, :title=>"Title", :body=>"Body", :user_id=>1, :reply_to_message_id=>1
	end

end
        