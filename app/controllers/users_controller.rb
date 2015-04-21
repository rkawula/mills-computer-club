class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show

		@user = User.find_by_id(params[:id])

		unless @user
			flash[:notice] = "User not found."
			redirect_to users_path 
		end

	end

	def profile

		unless current_user
			flash[:notice] = "Please log in to edit your profile."
			redirect_to users_path
		end

	end
end