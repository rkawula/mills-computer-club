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
    unless @post.update_attributes params[:post]
      flash[:danger] = 'Something went wrong!'
      return redirect_to admin_posts_path
    end
    @post.slug = @post.create_slug
    flash[:success] = @post.published ? 'Post published!' : 'Post updated.'
    redirect_to post_path @post
  end

  def destroy
    @post = Post.find_by_slug params[:id]
    Post.delete @post
    flash[:info] = 'Post deleted.'
    redirect_to admin_posts_path
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'That post not found.'
    redirect_to admin_posts_path
  end
end
