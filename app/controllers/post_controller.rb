class PostController < ApplicationController

	def index
		@posts = Post.limit(5)
	end

	def show

	end
end
