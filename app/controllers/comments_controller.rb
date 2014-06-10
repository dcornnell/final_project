class CommentsController < ApplicationController
	def new 
		@new_comment = Comment.new
	end

	def create
		@new_comment = Comment.new(comment_params)
		if @new_comment.save
			redirect_to :back
		else
			redirect_to :back
		end
	end

private

	def comment_params
		params.require(:comment).permit!
	end
end
