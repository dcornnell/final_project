class PostsController < ApplicationController

	load_and_authorize_resource param_method: :posts_params
	
	def index
		@posts = Post.order('post_date desc')
	end

	def new 
		@new_post = Post.new
	end


	def create
		@new_post = Post.new(post_params)
		if @new_post.save
			redirect_to :back
			
		else
			redirect_to :back
		end
	end

private

	def post_params
		params.require(:post).permit!
	end
end

