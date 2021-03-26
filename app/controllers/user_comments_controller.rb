class UserCommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments.order(created_at: :desc).page(params[:page]).per(6)
  end
end
