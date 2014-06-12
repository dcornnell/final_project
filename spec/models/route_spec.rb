require 'spec_helper'

describe Route do
	it 'should be invalid without grade_id' do
		FactoryGirl.build(:route, grade_id: nil).should_not be_valid
	end
end