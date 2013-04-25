require 'spec_helper'

describe ViewMessages do
	before :each do
		@interactor = ViewMessages.new
	end

	describe "#new" do
		it "takes no parameters and doesn't error out" do
			@interactor.should be_an_instance_of ViewMessages
		end
	end

	describe "#get_messages" do
		it "takes no parameters and returns array" do
			result = @interactor.get_messages
			result.should be_an_instance_of Hash
		end
	end
end