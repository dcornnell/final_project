class UsersController < ApplicationController
	def new
		@new_user = User.new
	end

	def create
		@new_user = User.new(user_params)
		if @new_user.save 
			redirect_to login_path, notice: "Your user has been created!"
		else
			render new_user_path, notice: "You have failed to create a new user!"
		end
	end


	def show 
		@user = User.find(params[:id])
		@user.total_score = @user.attempts.sum(:attempt_score)
		@user.save
		@attempts = AttemptsPresenter.new(@user.attempts)
		@grade_names = @attempts.collect_grades
		puts "---------------------------------------------------"
		puts @grade_names
		puts "---------------------------------------------------"
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to user_path(current_user)
		else
			render edit_user_path
		end
	end


	private

	def user_params
		params.require(:user).permit!
	end
end
