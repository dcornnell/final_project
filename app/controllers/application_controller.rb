class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    registration_params = [:user_name, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end

  #if a user tries to access some place they should
  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to user_path(current_user), notice: "you do not have permission to access this page"
  #  end
 
  #checks for a logged in user
  # def current_user
  # 	current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

end
