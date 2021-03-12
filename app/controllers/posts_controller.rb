class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @posts = Post.page(params[:page]).per(3)
    @comment = Comment.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.find(params[:id])
    @comment = Comment.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    @post.save
    redirect_to posts_path
  end
  
    private
  
  def post_params
    params.require(:post).permit(:post_image, :genre)
  end
end
