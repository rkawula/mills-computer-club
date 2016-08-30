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
    if invalid_input? params[:team]
      return redirect_to new_hackathon_team_path(@hackathon)
    end
    @team = Team.validate_and_create(params[:team], @hackathon)
    return redirect_to hackathon_team_path(@hackathon, @team) if @team.valid?
    # Invalid team, but present fields.
    flash[:warning] = 'Your project name is taken! Please use another.'
    redirect_to new_hackathon_team_path(@hackathon)
  end

  def tentative
    redirect_to hackathon_teams_path(@hackathon) unless admin?
    @teams = Team.where approved: false
  end

  private

  def invalid_input?(team)
    if team[:summary] == '' || team[:email] == ''
      flash[:warning] = 'Name and Email fields must be filled in.'
      return true
    end
    false
  end
end
