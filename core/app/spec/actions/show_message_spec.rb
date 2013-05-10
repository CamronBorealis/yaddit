require_relative '../../actions/show_message'

describe ShowMessage do
	before :each do
		@plug = double("MessageJackContract")
		@action = ShowMessage.new @plug
	end

	it 'should show message for given id' do
		@plug.stub(:get_by_id).with(1).and_return({:id=>1, :title=>"Title", :body=>"Body", :user_id=>1, :reply_to_message_id=>1})
		@plug.should_receive(:get_by_id).with(1).once

		result = @action.execute :id=>1
		result.to_hash.should eq :id=>1, :title=>"Title", :body=>"Body", :user_id=>1, :reply_to_message_id=>1		
	end
end