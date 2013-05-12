require_relative '../../entities/user'
require_relative '../../contracts/encryption_jack_contract'

describe User do
	before :all do
		@valid_users = [
			{:id=>1, :email=>"test@test.com", :first_name=>"Camron", :last_name=>"Bute"},
			{:id=>1, :email=>"test@test.com", :password=>"pass", :password_confirmation=>"pass", :first_name=>"Camron", :last_name=>"Bute"}
		]
		@invalid_users = [
			{:id=>1, :email=>"", :first_name=>"F", :last_name=>"L"},
			{:id=>1, :email=>"test@test.com", :password=>"password", :password_confirmation=>"pasword", :first_name=>"F", :last_name=>"L"},
			{:id=>1, :email=>"test@test.com", :password=>"", :password_confirmation=>"", :first_name=>"Camron", :last_name=>"Bute"}
		]
	end

	describe '.populate' do
		it 'should populate with valid input and no password' do
			input = {:id=>1, :email=>"a@b.com", :first_name=>"F", :last_name=>"L"}
			user = User.new
			user.populate input
			user.to_hash.should eq :id=>1, :email=>"a@b.com", :first_name=>"F", :last_name=>"L", :password=>nil, :password_confirmation=>nil
		end

		it 'should populate with valid input and matching password confirmation' do
			input = {:id=>1, :email=>"a@b.com", :password=>"pass",
			 :password_confirmation=>"pass", :first_name=>"f", :last_name=>"l"}
			user = User.new
			user.populate input
			user.to_hash.should eq :id=>1, :email=>"a@b.com", :password=>"pass",
			 :password_confirmation=>"pass", :first_name=>"f", :last_name=>"l"
		end

		it 'should raise an error with blank email' do
			input = @invalid_users.first
			user = User.new
			expect{ user.populate input }.to raise_error Validation::InvalidWritingError
		end

		it 'should raise an error with blank password' do
			input = @invalid_users[2]
			user = User.new
			expect{ user.populate input }.to raise_error Validation::InvalidWritingError
		end

		it 'should raise an error with invalid password confirmation' do
			input = {:id=>1, :email=>"a@b.com", :password=>"A", :password_confirmation=>"B", :first_name=>"F", :last_name=>"L"}
			user = User.new
			expect{ user.populate input }.to raise_error Validation::InvalidWritingError
		end

	end

	describe '.to_hash' do
		it 'should to_hash with valid input' do
			input = {:id=>1, :email=>"test@test.com", :first_name=>"Camron", :last_name=>"Bute"}
			user = User.new
			user.populate input
			user.to_hash.should eq :id=>1, :email=>"test@test.com", :first_name=>"Camron", :last_name=>"Bute", :password => nil, :password_confirmation => nil
		end
	end

	describe '.encrypt_password' do
		it 'should store encrypted information' do
			input = {:id=>1, :email=>"a@b.com", :first_name=>"F", :last_name=>"L", :password=>"1", :password_confirmation=>"1"}
			user = User.new
			user.populate input
			encryptor = double("EncryptionJackContract")
			encryptor.stub(:generate_salt).and_return("salt1234")
			encryptor.stub(:generate_hash).with(user.password,"salt1234").and_return("hash1234")

			user.encrypt_password encryptor

			user.password_hash.should eq "hash1234"
		end
	end

end
