class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    binding.pry
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def photo
    @user = User.find(params[:user_id])
    @posts = @user.posts.all.order(created_at: :desc)
    @posts = @user.posts.page(params[:page]).per(6)
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :email, :introduction, :profile_image, :age)
  end
end
