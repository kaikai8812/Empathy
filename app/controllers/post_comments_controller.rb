class PostCommentsController < ApplicationController
  def index
  end

  def create
    @post_comment = current_user.post_comments.new(post_comment_params)
    # binding.pry
    @post_comment.save
    redirect_to request.referer
    
  end

  def update
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment, :trouble_id)
  end
end
