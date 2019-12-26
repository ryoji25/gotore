class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit]
  skip_before_action :authenticate_user!, only: [:index, :show]

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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy if @post.user_id == current_user.id
    redirect_to user_path(current_user.id)
  end

  def list
    @search_word = params[:search]
    @searches = Post.where('CONCAT(title, text, place, date) LIKE(?)', "%#{params[:search]}%").limit(50).where.not(user_id: current_user)if @search_word.present?
  end

  private
  def post_params
      params.require(:post).permit(:title, :text, :date, :place).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
