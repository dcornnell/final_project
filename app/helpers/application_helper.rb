module ApplicationHelper
	

	def grade_format(grade, modifier)
		if modifier == 1
			value = "+"
		elsif modifier == 2
			value = "-"
		else
			value = ""
		end
		return "V#{grade}#{value}"
	end

			
end
