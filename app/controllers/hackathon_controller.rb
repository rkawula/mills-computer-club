class HackathonController < ApplicationController
  before_filter :set_current_hackathon
  # The @hackathon variable is set across all actions by
  #  set_current_hackathon in the ApplicationController.
  # The current hackathon is set to the first/only
  #  hackathon currently in the database from the
  #  module HackathonHelper.
  # Will need updating after the current Hackathon.

  def show
  end

  def current
    render 'show'
  end

  def faq
  end

  def sponsors
  end
end
