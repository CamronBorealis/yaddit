require_relative '../../actions/add_user'
require_relative '../../entities/entity_factory'

describe AddUser do
	before :each do 
		@plug = double("UserJackContract")
		@encryptor = double("EncryptionJackContract")
		@entity_factory = double("EntityFactory")
		@action = AddUser.new @plug, @encryptor, @entity_factory
	end

	it 'should encrypt password before saving' do
		input = {:user => {:first_name=>"F", :last_name=>"L", :password=>"pass", :password_confirmation=>"pass", :email=>"a@b.com"}}
		user_double = double("User")
		user_double.should_receive(:encrypt_password).with(@encryptor).once
		user_double.should_receive(:to_hash).and_return(input[:user])
		@entity_factory.should_receive(:generate_user).with(input[:user]).and_return(user_double)
		@plug.should_receive(:create).with(input[:user])
		@action.execute input
	end
end