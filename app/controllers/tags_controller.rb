class TagsController < ApplicationController
	load_and_authorize_resource param_method: :tagss_params
	def new
		@new_tag = Tag.new
		@route = Route.new
	end

	def create
		@new_tag = Tag.new(tag_params)
		@route = Route.find(params[:route_id])
		if @new_tag.save
			@route.tags << @new_tag
			redirect_to :back
		else
			redirect_to :back
		end
	end

private

	def tag_params
		params.require(:tag).permit!

	end
end