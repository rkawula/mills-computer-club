class PostController < ApplicationController
  def index
    @posts = Post.where(published: true).order(created_at: :desc).limit 5
  end

  def show
    @post = Post.find_by_slug params[:id]
    unless @post.published?
      flash[:warning] = 'Sorry! That post is not yet published.'
      redirect_to post_index_path
    end
    begin
      @author = User.find @post.user_id
    rescue ActiveRecord::RecordNotFound
      @author = nil
    end
  end
end
