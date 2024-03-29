require_relative '../../actions/authenticate_user'
require_relative '../../entities/entity_factory'

describe AuthenticateUser do
	before :each do
		@jack = double("UserJackContract")
		@entity_factory = double("EntityFactory")
		@encryptor = double("EncryptionJackContract")
		@action = AuthenticateUser.new @jack, @entity_factory, @encryptor
	end

	it 'should return verification message and user id on hash match' do
		input = {:credentials=>{:email=>"test@test.com", :password=>"password"}}
		user_data = {:user=>{:id=>1}}
		user_double = double("User")
		user_double.should_receive(:password_hash).and_return("MyHash")
		user_double.should_receive(:password_salt).and_return("MySalt")
		user_double.should_receive(:id).and_return(1)
		@jack.should_receive(:get_by_email).with(input[:credentials][:email]).and_return(user_data)
		@entity_factory.should_receive(:generate_user).with(user_data[:user]).and_return(user_double)
		@encryptor.should_receive(:generate_hash).with(input[:credentials][:password], "MySalt").and_return("MyHash")
		result = @action.execute input
		result.should eq 1
	end

	it 'should return denied message on hash mismatch' do
		input = {:credentials=>{:email=>"test@test.com", :password=>"password"}}
		user_data = {:user=>{:id=>1}}
		user_double = double("User")
		user_double.should_receive(:password_hash).and_return("MyHash")
		user_double.should_receive(:password_salt).and_return("MySalt")
		@jack.should_receive(:get_by_email).with(input[:credentials][:email]).and_return(user_data)
		@entity_factory.should_receive(:generate_user).with(user_data[:user]).and_return(user_double)
		@encryptor.should_receive(:generate_hash).with(input[:credentials][:password], "MySalt").and_return("MyOtherHash")
		result = @action.execute input
		result.should eq nil
	end

	it 'should return denied message on no email found' do
		input = {:credentials=>{:email=>"test@test.com", :password=>"password"}}
		user_data = {:user=>nil}
		@jack.should_receive(:get_by_email).with(input[:credentials][:email]).and_return(user_data)
		result = @action.execute input
		result.should eq nil
	end
end