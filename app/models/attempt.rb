class Attempt < ActiveRecord::Base
belongs_to :user
belongs_to :route
validates_presence_of :date_attempted

scope :this_day, -> {where('date_attempted = ?' , Date.today)}
scope :yesterday, -> {where('date_attempted = ?', Date.today - 1)}
scope :this_week, -> {where('date_attempted > ?', 7.days.ago)}
scope :last_week, -> {where('date_attempted >= ? AND date_attempted <= ?', 14.days.ago, 7.days.ago)}
scope :this_month, -> {where('date_attempted > ? ',   1.months.ago)}
scope :last_month, -> {where('date_attempted >= ? AND date_attempted <= ?', 2.months.ago, 1.months.ago )}
scope :this_year, -> {where('date_attempted > ? ',   1.years.ago)}
scope :last_year, -> {where('date_attempted >= ? AND date_attempted  <= ?', 2.years.ago,   1.years.ago)}

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