class UsersController < ApplicationController
	def index
	end

	def show
		@user = User.find_by_id(params[:user_id])
	end
end