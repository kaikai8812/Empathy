class TroublesController < ApplicationController
before_action :set_q, only: [:index, :search]
  
  def index
    @troubles = Trouble.all.where.not(user_id: current_user.id)  #自分の投稿以外を表示させる、
  end
  
  def my_index
    @troubles = current_user.troubles
  end
  

  def new
    @trouble = Trouble.new
    @categories = Category.all
  end

  def create
    @trouble = Trouble.new(trouble_params)
    @trouble.user_id = current_user.id
    if @trouble.save
      redirect_to trouble_path(@trouble)
    else
      render 'new'
    end
  end

  def show
    @trouble = Trouble.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @trouble.post_comments.all
    # ↓チャット関係
    @chat_message = ChatMessage.new
    
    
    
  end

  def edit
    @trouble = Trouble.find(params[:id])
  end

  def update
    @trouble = Trouble.find(params[:id])
    if @trouble.update(trouble_params)
      redirect_to trouble_path(@trouble)
    else
      render 'edit'
    end
  end
  
  def status_update
    @trouble = Trouble.find(params[:id])
    @trouble.update(is_solved: true)
    redirect_to trouble_path(@trouble)
  end
  def search
    @results = @q.result.where.not(user_id: current_user.id)
  end

  def destroy
    @trouble = Trouble.find(params[:id])
    @trouble.destroy
    redirect_to my_trouble_path
  end
  
  private
  
  def trouble_params
    params.require(:trouble).permit(:title, :content, :category_id)
  end
  
  def set_q
    @q = Trouble.ransack(params[:q])
  end
  
end
