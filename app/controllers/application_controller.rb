class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  include HackathonHelper, SessionsHelper

  def set_current_hackathon
    @hackathon ||= current_hackathon
  end
end
