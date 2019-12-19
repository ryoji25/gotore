class UsersController < ApplicationController

  def show
    @posts = Post.where(user_id: current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end
  
end
