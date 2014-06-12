require 'spec_helper'

describe Tag do
	it 'should be invalid without name' do
		FactoryGirl.build(:tag, name: nil).should_not be_valid
	end

	it 'should be invalid if the name longer than 12' do
		FactoryGirl.build(:tag, name: "this is way to long to be a tag, i mean way way way way way way way to long").should_not be_valid
	end

end