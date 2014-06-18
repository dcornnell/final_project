class RatingsController < ApplicationController


	def create
		@new_rating = Rating.new(rating_params)
		if @new_rating.save
			redirect_to :back
		else
			redirect_to :back, notice: "you have already rated this route"
		end
	end


	def edit
		@rating = Rating.find(param[:id])
	end	
	
	def update
		@rating = Rating.find(param[:id])
		if @rating.update_attributes(rating_params)
			redirect_to :back, notice: "rating updated"
		else
			redirect_to :back, notice: "failed to added the rating"
		end
	end



private

	def rating_params
		params.require(:rating).permit!
	end
end




