require 'spec_helper'

describe Attempt do
	it 'should be invalid without a date_attempted' do
		FactoryGirl.build(:attempt, date_attempted: nil).should_not be_valid
	end

	it 'should be be able to modify a score' do
		attempt = FactoryGirl.build(:attempt)
		new_score = attempt.add_modifiers(10, true, false)
		new_score.should eq(10)
	end

end