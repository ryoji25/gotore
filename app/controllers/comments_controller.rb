class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    comment.save
    redirect_to "/posts/#{comment.post.id}"   #コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def comment_params
    params.permit(:comment, :post_id).merge(user_id: current_user.id)
  end

end
