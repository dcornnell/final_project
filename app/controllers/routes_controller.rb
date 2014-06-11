class RoutesController < ApplicationController
	load_and_authorize_resource param_method: :routes_params
	def index 
		@routes = Route.all
	end

	def show
		@route = Route.find(params[:id])
		@new_comment = @route.comments.build
		@new_tag = @route.tags.build
		@new_rating = @route.ratings.build
	end


	def new
		@new_route = Route.new
	end

	def create 
		@new_route = Route.new(route_params)
		
		if @new_route.save
			redirect_to routes_path, notice: "The new route has been added"
		else
			render new_route_path, notice: "you have failed to add this route"
		end
	end

	def edit 
		@route = Route.find(params[:id])
	end

	def update
		@route = Route.find(params[:id])
		if @route.update_attributes(route_params)
			redirect_to routes_path, notice: "the route has been updated"
		else
			render edit_route_path(@route.id), notice: "failed to update the path"
		end
	end




	def destroy 
		@route = Route.find(params[:id])
		if @route.delete
			redirect_to routes_path, notice: "the route has been removed"
		else
			redirect_to :back, notice:  "something went wrong the route is still here!"
		end
	end
 	#Route for updating just the rating
	def change_rating
	end



	private

	def route_params
		params.require(:route).permit!
	end
end
