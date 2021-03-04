class TroublesController < ApplicationController
  
  def index
    @troubles = Trouble.all
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
  end

  def edit
  end

  def update
  end

  def search
  end

  def destroy
  end
  
  private
  
  def trouble_params
    params.require(:trouble).permit(:title, :content, :category_id)
  end
  
end
