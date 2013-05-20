require_relative '../../actions/reply_to_message'
require_relative '../../contracts/message_jack_contract'

describe ReplyToMessage do
	before :each do
		@jack = double("MessageJackContract")
		@entity_factory = double("EntityFactory")
		@action = ReplyToMessage.new @jack, @entity_factory
	end

	it 'should post message with valid input' do
		input = {:message=>{:id=>2, :title=>nil, :body=>"Reply", :reply_to_message_id=>1, :user_id=>1}}
		message_double = double("Message")
		message_double.should_receive(:to_hash).and_return(input[:message])
		@jack.should_receive(:create).with(input[:message]).and_return(3)
		@entity_factory.should_receive(:generate_message).with(input[:message]).and_return(message_double)
		result = @action.execute input
		result.should eq 3
	end
end