class RoutesController < ApplicationController
	def index 
		@routes = Route.all
	end

	def show
		@route = Route.find(params[:id])
	end


	def new
		@new_route = Route.new
	end

	def create 
		@new_route = Route.new(route_params)
		@new_route.score = @new_route.calculate_grade(@new_route.grade, @new_route.modifier)

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



	private

	def route_params
		params.require(:route).permit!
	end
end
