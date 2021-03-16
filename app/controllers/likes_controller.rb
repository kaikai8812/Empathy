class LikesController < ApplicationController
  def create
    @post_comment = PostComment.find(params[:post_comment_id])
    if current_user != @post_comment.user
      @like = current_user.likes.new(post_comment_id: @post_comment.id)
      @like.save
      @post_comment.comment_display_true  #いいね数によって、表示ステータスを変化させる。
      @post_comment.create_notification_like!(current_user) #いいねを伝える通知メソッド
      #悩み投稿ユーザーに、コメントが届いたことを伝える通知。
      if @post_comment.is_displayed == true
        @post_comment.create_notification_comment!(@post_comment.user, @post_comment.trouble.user.id)
      end
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
  end
end


# <% if current_user.id != @trouble.user_id && current_user.id != post_comment.user_id %>