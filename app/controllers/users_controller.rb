class UsersController < ApplicationController
	load_and_authorize_resource param_method: :users_params
	skip_authorize_resource :only => :search
	
	def index
		@users = User.all.order('total_score DESC')
	end



	

	def show 
		@user = User.find(params[:id])
		@user.total_score = @user.attempts.sum(:attempt_score)
		@user.save
		@attempts = AttemptsPresenter.new(@user.attempts)
		@grade_names = @attempts.collect_grades
		@tag_names =@attempts.collect_tags
	end



	def search
		@search_results = User.search(params[:search])
		puts @search_results
		render results_users_path 
	end


	private

	def user_params
		params.require(:user).permit!
	end
end

