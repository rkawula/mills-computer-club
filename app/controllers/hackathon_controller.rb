class HackathonController < ApplicationController

	# The @hackathon variable is set across all actions by
	#  a before_filter in the ApplicationController.
	# Will need updating after the current Hackathon.

	def show
	end

	def current
		render 'show'
	end

	def faq
	end

end
