class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = Post.new
  end
  
  def edit
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  
  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image, :age)
  end
end
