class PostCommentsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
    # @comment_page = params[:comment][:page]
    # @comment_count = params[:comment][:comment_count]
    # if @comment_count.to_i >= 5
    #   page = @comment_page.to_i + 1
    # else
    #   page = @comment_page.to_i
    # end
    # @page = page
    # @comments = @comment.post.comments.order(created_at: :desc)
    # @comments = @comment.post.comments.page(@page).per(5)
    # render :index
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
