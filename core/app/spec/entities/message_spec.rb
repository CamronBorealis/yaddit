require_relative '../../entities/message'

describe Message do
  
  describe '.populate' do
    it 'should populate with valid input' do
    	input = { :title => 'Valid title', :body => 'Valid Body', :id => 1, :user_id => 1, :reply_to_message_id => nil }
    	message = Message.new
    	message.populate input
    	message.to_hash.should eq :title => 'Valid title', :body => 'Valid Body', :id => 1, :user_id => 1, :reply_to_message_id => nil
    end

    it 'should raise an error with invalid input' do
    	input = { :title => '', :body => 'This has invalid title', :id => 1, :user_id => 1, :reply_to_message_id => nil }
    	message = Message.new
    	expect{ message.populate input }.to raise_error Validation::InvalidWritingError
    end

  end
    
  describe '.to_hash' do
    it 'should to_hash with valid input' do
    	input = { :title => 'Valid title', :body => 'Valid Body', :id => 1, :user_id => 1, :reply_to_message_id => nil }
    	message = Message.new
    	message.populate input
    	message.to_hash.should eq :title => 'Valid title', :body => 'Valid Body', :id => 1, :user_id => 1, :reply_to_message_id => nil
    end
  end
    
end
