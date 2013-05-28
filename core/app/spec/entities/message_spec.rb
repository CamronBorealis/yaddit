require_relative '../../entities/message'

describe Message do
    before :all do
        @valid_messages = [{ :title => 'Valid title', :body => 'Valid Body', :id => 1, :user_id => 1, :reply_to_message_id => nil, :root_message_id=>nil }]
        @invalid_messages = [{ :title => '', :body => 'Valid Body', :id => 1, :user_id => 1, :reply_to_message_id => nil, :root_message_id=>nil }]
    end
  
  describe '.populate' do
    it 'should populate with valid input' do
    	input = @valid_messages.first
    	message = Message.new
    	message.populate input
    	message.to_hash.should eq @valid_messages.first
    end

    it 'should raise an error with invalid input' do
    	input = @invalid_messages.first
    	message = Message.new
    	expect{ message.populate input }.to raise_error Validation::InvalidWritingError
    end

  end
    
  describe '.to_hash' do
    it 'should to_hash with valid input' do
    	input = @valid_messages.first
    	message = Message.new
    	message.populate input
    	message.to_hash.should eq @valid_messages.first
    end
    end
end
