class TeamsController < ApplicationController

	def index
		# Update to handle future year/semester combos.
		@teams = Team.where approved: true
		@hackathon = current_hackathon
	end

	def show
		@team = Team.find params[:id]
	end

	def new
		@hackathon = current_hackathon
	end

	def create
		@team = Team.create! project_name: params[:team][:project_name],
				summary: params[:team][:summary],
				email: params[:team][:primary_contact_email]
		redirect_to hackathon_team_path(current_hackathon, @team)
	end

	def tentative
		@hackathon = current_hackathon
		@teams = Team.where approved: false
	end

end
