class TeamsController < ApplicationController

	def index
		# Update to handle future year/semester combos.
		@teams = Team.all
	end

	def show
	end

end
