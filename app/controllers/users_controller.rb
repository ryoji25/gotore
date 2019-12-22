class UsersController < ApplicationController
  before_action :check_user, only: [:edit]

  def show
    @posts = Post.where(user_id: current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    user = User.find(params[:id])
    if user.id == current_user.id
      user.update(user_params)
      redirect_to user_path
    end
  end
  

  private
  def user_params
      params.require(:user).permit(:name, :profile, :image)
  end

  def check_user
    user = User.find_by(id: params[:id])
    if user.id != current_user.id
      redirect_to root_path
    end
  end

end


