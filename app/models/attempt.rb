class Attempt < ActiveRecord::Base
belongs_to :user
belongs_to :route
validates_presence_of :date_attempted

scope :this_day, -> {where('date_attempted = ?' , Date.today)}
scope :this_week, -> {where('date_attempted > ?', 7.days.ago)}
scope :this_month, -> {where('date_attempted > ? ',   30.days.ago)}
scope :this_year, -> {where('date_attempted > ? ',   365.days.ago)}

	# adds or subtracts points based on params provided
	def add_modifiers(grade, completed, flash)
	
			if completed == true
				if flash == true
						grade *= 1.5
				else
					grade
				end
			else
				grade *= 0.25
			end
			grade
		end




end