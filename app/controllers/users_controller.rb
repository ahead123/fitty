class UsersController < ApplicationController
	before_action :set_user, only:[:show]

	def index
		@user = User.all
	end

	def show
	end

	private

	def set_user
		@user = User.find_by(username: params[:id])
	end

	def users_params
       params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :username)
    end

end