class HackathonController < ApplicationController


	def show
		# Update to take requested hackathons
		@hackathon = current_hackathon
	end

	def current
		@hackathon = current_hackathon
		render 'show'
	end

end
