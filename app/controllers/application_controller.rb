class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  

  #if a user tries to access some place they should
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to user_path(current_user), notice: "you do not have permission to access this page"
   end
 
  #checks for a logged in user
  def current_user
  	current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  
end
