
require 'rails_helper'

describe UsersController do
	
	describe 'Get #show' do
		it 'assign a user to @user' do
			@user = FactoryGirl.create(:user) 
			get :show, id:@user.id
			@user.should_not be nil
		end

		it 'renders the show page' do
		 	@user = FactoryGirl.create(:user) 
		 	get :show, id:@user.id
		 	response.should render_template :show
		end
	end

	describe 'Get #new' do
		it 'assings a new user to @new_user' do
			@new_user = FactoryGirl.create(:user)
			get :show, id:@new_user.id
			@new_user.should_not be nil
		end
		it 'renders the new page' do
			get :new
			response.should render_template :new
		end
	end

	describe 'Post #create' do
		
		context 'valid user attributes' do
			it 'creates a new user' do
				user_attrs = FactoryGirl.attributes_for(:user)
				expect {
					post :create, user: user_attrs
				}.to change(User, :count).by(1)
			end

			# it 'redirects to the index page' do
			# 	get login_path
			# 	response.should render_template login_path
			# end
		end
		
		context 'invalid user attributes' do
			it 'doesnt create a new user' do
				user_attrs = FactoryGirl.attributes_for(:invalid_user)
				expect {
					post :create, user: user_attrs
				}.to change(User, :count).by(0)
			end
			it 'redirects to the new user page' do
				get :new
				response.should render_template :new
			end
		end
	end

	describe 'Get #edit' do
		it 'retrieves the user that is going to be edited' do
			@user = FactoryGirl.create(:user) 
			get :show, id: @user.id
			@user.should_not be nil
		end


		# it 'should render the edit page' do
		# 	@user = FactoryGirl.create(:user) 
		# 	get :edit , id:@user.id
		# 	response.should render_template :edit
		# end
	end
	describe 'Put #update'
		
		context 'valid update' do
			before :each do
				@user =FactoryGirl.create(:user)
			end
			# it 'should update the information' do
			# 	put :update, id: @user, user: FactoryGirl.attributes_for(:user, name: "Name Change")
			# 	@user.reload
			# 	@user.name.should eq("Name Change")
			# end
			# it 'should redirect to the users page' do
			# 	get user_path(@user.id)
			# 	response.should render_template user_path(@user.id)
			# end
		end
		context 'invalid update' do 
			before :each do
				@user =FactoryGirl.create(:user)
			end
			# it 'should not update the information' do
			# 	put :update, id: @user.id, user: FactoryGirl.attributes_for(:user, name: nil)
			# 	@user.reload
			# 	@user.first_name.should eq("William")
			# end
			# it 'should redirect to the page' do
			# 	@user = FactoryGirl.create(:user) 
			# 	get :edit , id:@user.id
			# 	response.should render_template :edit
			# end
		end

end

