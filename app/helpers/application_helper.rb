module ApplicationHelper

#helper to make dates display i want them to
	def formatted_date(date)
		date.strftime("%B %-d, %Y")
	end
		
end
