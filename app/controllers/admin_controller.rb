class AdminController < ApplicationController
  before_action :authorized?

  def index
    # Static links
  end

  private

  def authorized?
    redirect_to root_path unless admin?
  end
end
