class PostCommentsController < ApplicationController
#  def index　　#自分のコメント一覧作成のため。
#    @post_comments = current_user.post_comments
#    binding.pry
#  end

  def index
    @post_comments = current_user.post_comments
  end
  
  def create
    @post_comment = current_user.post_comments.new(post_comment_params)
    # binding.pry
    @post_comment.save
    redirect_to request.referer
    
  end

  def update
    @post_comment = PostComment.find(params[:id])
    if @post_comment.is_thanked == false
      @post_comment.update(is_thanked: true)
      # ↓チャット機能の記述
      #新規ルーム作成
      @room = Room.new
      @room.post_comment_id = @post_comment.id
      @room.save
      #Entryに、感謝したユーザーと、コメントしたユーザーの情報を格納
      Entry.create(user_id: current_user.id, room_id: @room.id)
      Entry.create(user_id: @post_comment.user_id, room_id: @room.id)
    elsif @post_comment.is_thanked == true
      @post_comment.update(is_thanked: false)
    end
    # binding.pry
    redirect_to request.referer
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment, :trouble_id, :is_thanked)
  end
end
