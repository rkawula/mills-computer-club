module SessionsHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def admin?
    logged_in? && session[:user_id] == current_user.id && current_user.admin
  end

  def logged_in?
    !current_user.nil?
  end
end
