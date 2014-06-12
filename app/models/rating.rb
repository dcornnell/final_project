class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :route
	validates_uniqueness_of :route_id, :scope => [:user_id]
	


end
