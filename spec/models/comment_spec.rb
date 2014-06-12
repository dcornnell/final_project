require 'spec_helper'

describe Comment do
	it 'should be invalid without content' do
		FactoryGirl.build(:comment, content: nil).should_not be_valid
	end

end