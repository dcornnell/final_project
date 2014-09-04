module ApplicationHelper

#helper to make dates display i want them to
	def formatted_date(date)
		date.strftime("%B %-d, %Y")
	end
		

# the next three methods makes devise login possible from non devise views
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
