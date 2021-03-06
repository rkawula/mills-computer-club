class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    return unless @user
    flash[:notice] = 'User not found.'
    redirect_to users_path
  end

  def profile
    unless current_user
      flash[:notice] = 'Please log in to edit your profile.'
      redirect_to users_path
    end
    @user = current_user
  end

  def edit_profile
    @user = current_user
    if params[:user][:profile] != ''
      @user.update_attributes params[:user]
      flash[:notice] = 'Saved changes.'
      render 'show'
    else
      flash[:notice] = 'Info not updated.'
      redirect_to users_path
    end
  end
end
