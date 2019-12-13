class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit]

  def index
    @posts = Post.limit(12).order("created_at DESC").includes(:user)
  end

  def show
    @comments = @post.comments.includes(:user)
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

  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.update(post_params)
      redirect_to root_path
    end
  end

  private
  def post_params
      params.require(:post).permit(:title, :text, :date, :place).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
