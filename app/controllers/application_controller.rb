class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	
	helper_method :current_user
	
	private
	def current_user
		user_id = session[:user_id]
		
		if user_id
			@current_user ||= User.find(user_id) 
		end
	end
	
	def authorize
		unless current_user
			redirect_to root_path
		end
	end
end
