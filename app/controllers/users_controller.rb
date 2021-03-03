class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    # binding.pry
    if @user.update(user_params)
      redirect_to users_path
    else
      render "edit"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
  
end
