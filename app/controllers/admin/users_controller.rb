class Admin::UsersController < AdminController
	layout "dashboard"
	before_filter :authorize
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Account successfully created."
		else
			render "new"
		end
	end
	
	def show
		@user = User.first
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end

