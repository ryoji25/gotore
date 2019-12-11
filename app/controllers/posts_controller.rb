class PostsController < ApplicationController

  def index
    @posts = Post.limit(12).order("created_at DESC").includes(:user)
  end

  def show
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to root_path
  end
  
  def edit
  end

  private
  def post_params
      params.require(:post).permit(:title, :text, :date, :place).merge(user_id: current_user.id)
  end

end
