class LikesController < ApplicationController
  def create
    @post_comment = PostComment.find(params[:post_comment_id])
    @like = current_user.likes.new(post_comment_id: @post_comment.id)
    @like.save
    redirect_to request.referer
  end

  def destroy
    @post_comment = PostComment.find(params[:post_comment_id])
    @like = current_user.likes.find_by(post_comment_id: @post_comment.id)
    @like.destroy
    redirect_to request.referer
  end
end
