class PostController < ApplicationController

	def index
		@posts = Post.where(published: true).order(created_at: :desc).limit 5
	end

	def show
		@post = Post.find params[:id]
		unless @post.published?
			flash[:warning] = "Sorry! That post is not yet published."
			redirect_to post_index_path
		end
	end
end
