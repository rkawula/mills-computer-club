class HackathonController < ApplicationController
	def show
		# Update to take requested hackathons
		@hackathon = Hackathon.first
	end

	def current
		@hackathon = Hackathon.first
		render 'show'
	end
end
