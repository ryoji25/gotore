class PostsController < ApplicationController

  def index
    @post = Post.limit(12).order("created_at DESC")
  end

  def show
  end
  
  def new
    @posts = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to root_path
  end
  
  private
  def post_params
      params.require(:post).permit(:title, :text, :date, :place).merge(user_id: current_user.id)
  end

end
