class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])

    # @#user = User.find(params[:user_id])
    @comments = @post.comments.order(created_at: :desc).page(params[:page]).per(6)
    @user = @post.user
    # @comments = @post.comments.page(params[:page]).per(6)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
    @comment_page = params[:comment][:page]
    @comment_count = params[:comment][:comment_count]
    if @comment_count.to_i >= 5
      page = @comment_page.to_i + 1
    else
      page = @comment_page.to_i
    end
    @page = page
    @comments = @comment.post.comments.order(created_at: :desc)
    @comments = @comment.post.comments.page(@page).per(5)
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
