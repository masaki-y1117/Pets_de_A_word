class CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments.order(created_at: :desc)
    @comments = @user.comments.page(params[:page]).per(6)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
    render :index
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    render :index
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
