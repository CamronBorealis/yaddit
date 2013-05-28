require_relative '../../actions/reply_to_message'
require_relative '../../contracts/message_jack_contract'

describe ReplyToMessage do
	before :each do
		@jack = double("MessageJackContract")
		@entity_factory = double("EntityFactory")
		@action = ReplyToMessage.new @jack, @entity_factory
	end

	it 'should post reply with correct root message id when parent root message id is present' do
		input = {:message=>{:id=>2, :title=>nil, :body=>"Reply", :reply_to_message_id=>1, :user_id=>1}}
		modified_input = {:id=>2, :title=>nil, :body=>"Reply", :reply_to_message_id=>1, :user_id=>1, :root_message_id=>150}
		message_double = double("Message")
		@jack.should_receive(:filter).with({:id=>1}).and_return({:messages=>[{:id=>1, :reply_to_message_id=>50, :root_message_id=>150}]})
		@entity_factory.should_receive(:generate_message).with(modified_input).and_return(message_double)
		@jack.should_receive(:create).with(modified_input).and_return(3)
		message_double.should_receive(:to_hash).and_return(modified_input)
		result = @action.execute input
		result.should eq 150
	end

	it 'should post reply with correct root message id when parent root message id is nil' do
		input = {:message=>{:id=>2, :title=>nil, :body=>"Reply", :reply_to_message_id=>1, :user_id=>1}}
		modified_input = {:id=>2, :title=>nil, :body=>"Reply", :reply_to_message_id=>1, :user_id=>1, :root_message_id=>1}
		message_double = double("Message")
		@jack.should_receive(:filter).with({:id=>1}).and_return({:messages=>[{:id=>1, :reply_to_message_id=>nil, :root_message_id=>nil}]})
		@entity_factory.should_receive(:generate_message).with(modified_input).and_return(message_double)
		@jack.should_receive(:create).with(modified_input).and_return(3)
		message_double.should_receive(:to_hash).and_return(modified_input)
		result = @action.execute input
		result.should eq 1
	end
end