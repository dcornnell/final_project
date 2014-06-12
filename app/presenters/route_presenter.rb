class RoutePresenter
	attr_accessor :route, :average_rating
	def initialize(route)
		@route = route
	end

	def average_rating(rating)
		@total = @route.rating * @route.rating_count
		@new_total = @total + rating
		@route.rating_count += 1

		@route.rating = @new_total/@route.rating_count
		@route.rating
		@route.save
	end
end
