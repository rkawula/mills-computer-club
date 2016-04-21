class Admin::PostsController < AdminController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new params[:post]
		@post.user_id = current_user.id
		@post.slug = @post.create_slug
		@post.save!
		redirect_to edit_admin_post_path @post
	end

	def edit
		@post = Post.find_by_slug params[:id]
	end

	def update
		@post = Post.find_by_slug params[:id]
		if @post.update_attributes params[:post]
			@post.slug = @post.create_slug
			if @post.published
				flash[:success] = "Post published!"
				return redirect_to post_path @post
			else
				flash[:success] = "Post updated."
			end
		else
			flash[:danger] = "Something went wrong!"
		end
		redirect_to admin_posts_path
	end

	def destroy
		begin
			@post = Post.find_by_slug params[:id]
			Post.delete @post
			flash[:info] = 'Post deleted.'
			redirect_to admin_posts_path
		rescue ActiveRecord::RecordNotFound
			flash[:danger] = 'That post not found.'
			redirect_to admin_posts_path
		end
	end
end