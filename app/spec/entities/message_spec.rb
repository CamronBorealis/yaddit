require_relative '../../entities/message'

describe Message do

	it 'should succeed with valid properties' do
		message = Message.new
		message.title = "This is a valid title"
	end

	it 'should raise error with empty title' do
		message = Message.new
		expect{message.title = ""}.to raise_error(Exception)
	end
end