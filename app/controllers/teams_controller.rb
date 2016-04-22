class TeamsController < ApplicationController
  before_action :set_current_hackathon
  def index
    # Update to handle future year/semester combos.
    # Currently static: @teams = Team.where approved: true
  end

  def show
    @team = Team.find params[:id]
    unless @team.approved || admin?
      redirect_to hackathon_teams_path(current_hackathon)
    end
  end

  def new
  end

  def create
    p_name = params[:team][:project_name]
    summary = params[:team][:summary]
    email = params[:team][:primary_contact_email]
    if summary == '' || email == ''
      flash[:warning] = 'All fields must be filled in.'
      redirect_to new_hackathon_team_path(@hackathon)
    else
      @team = Team.validate_and_create(p_name, summary, email, @hackathon)
      if @team.valid?
        redirect_to hackathon_team_path(@hackathon, @team)
      else
        # Invalid team, but present fields.
        flash[:warning] = 'Your project name is taken! Please use another.'
        redirect_to new_hackathon_team_path(@hackathon)
      end
    end
  end

  def tentative
    redirect_to hackathon_teams_path(@hackathon) unless admin?
    @teams = Team.where approved: false
  end
end
