require_relative '../../actions/add_message'
require_relative '../../entities/entity_factory'

describe AddMessage do
	before :each do
		@jack = double("MessageJackContract")
		@factory = double("EntityFactory")
		@action = AddMessage.new @jack, @factory
	end

	it 'should add message successfully' do
		input = {:message=>{:id=>-1, :title=>"T", :body=>"B", :user_id=>1, :reply_to_message_id=>nil}}
		message_double = double("Message")
		message_double.should_receive(:to_hash).and_return(input[:message])
		@jack.should_receive(:create).with(input[:message])
		@factory.should_receive(:generate_message).with(input[:message]).and_return(message_double)
		@action.execute input
	end
end
