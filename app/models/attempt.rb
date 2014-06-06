class Attempt < ActiveRecord::Base
belongs_to :user
belongs_to :route
validates_presence_of :date_attempted


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