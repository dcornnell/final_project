class RoutesController < ApplicationController
	load_and_authorize_resource param_method: :routes_params
	def index 
		@routes = Route.all
	end

	def show
		@route = Route.find(params[:id])
		@new_comment = @route.comments.build
		@new_tag = @route.tags.build
		if current_user.present?
			if @route.ratings.where('user_id = ?', current_user.id)
				@new_rating = @route.ratings.build
			else
				@rating = @route.ratings.where('user_id = ?', current_user.id)
			end
		end
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






	private

	def route_params
		params.require(:route).permit!
	end
end
