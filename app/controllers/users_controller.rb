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
		puts @user
	end

	private

	def user_params
		params.require(:user).permit!
	end
end
