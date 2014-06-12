require 'spec_helper'

describe User do
	it 'should be invalid without a user_name' do
	FactoryGirl.build(:user, user_name: nil).should_not be_valid
	end

	it 'should be invalid without a email' do
		FactoryGirl.build(:user, email: nil).should_not be_valid
	end

	it 'should be invalid if the user_name is not unique' do
		FactoryGirl.build(:user)
		user = User.new(:user_name => "Madmouth")
		user.should_not be_valid
	end

	it 'should be invalid if the email is not unique' do
		FactoryGirl.build(:user)
		user = User.new(:email => "BillyD@exmaple.com")
		user.should_not be_valid
	end

end



