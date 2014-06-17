class AttemptsController < ApplicationController
	load_and_authorize_resource param_method: :attempts_params

	def index
	 	@attempts = Attempt.where(user_id: current_user)
	end


	

	def new
		@new_attempt = Attempt.new
	end

	def create 
		@new_attempt = Attempt.new(attempt_params)
		@new_attempt.attempt_score = @new_attempt.add_modifiers(@new_attempt.route.grade.score, @new_attempt.completed, @new_attempt.flash)
		if @new_attempt.save
			redirect_to user_path(current_user), notice: "The new attempt has been added"
		else
			render new_attempt_path, notice: "you have failed to add this attempt"
		end
	end

	def edit 
		@attempt = Attempt.find(params[:id])
	end

	def update
		@attempt = Attempt.find(params[:id])
		if @attempt.update_attributes(attempt_params)
			redirect_to attempts_path, notice: "the attempt has been updated"
		else
			render edit_attempt_path(@attempt.id), notice: "failed to update the path"
		end
	end

	def destroy 
		@attempt = Attempt.find(params[:id])
		if @attempt.delete
			redirect_to attempts_path, notice: "the attempt has been removed"
		else
			redirect_to :back, notice:  "something went wrong the attempt is still here!"
		end
	end

	private



	def attempt_params
		params.require(:attempt).permit!
	end
end
