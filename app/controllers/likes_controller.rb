class LikesController < ApplicationController
  def create
    @post_comment = PostComment.find(params[:post_comment_id])
    if current_user != @post_comment.user
      @like = current_user.likes.new(post_comment_id: @post_comment.id)
      @like.save
      @post_comment.comment_display_true  #インスタンスメソッド
      @post_comment.create_notification_like!(current_user) #通知メソッド
      redirect_to request.referer
    else
      flash[:likes] = '自分のコメントにはいいねできません。'
      redirect_to request.referer
    end
  end

  def destroy
    @post_comment = PostComment.find(params[:post_comment_id])
    @like = current_user.likes.find_by(post_comment_id: @post_comment.id)
    @like.destroy
    @post_comment.comment_display_false  #インスタンス
    redirect_to request.referer
  end
end


# <% if current_user.id != @trouble.user_id && current_user.id != post_comment.user_id %>