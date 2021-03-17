class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @posts = Post.page(params[:page]).per(3)
    @post_comment = Comment.
    @comment = Comment.new
    @all_ranks = Comment.find(Favorite.group(:comment_id).order('count(comment_id) desc').limit(5).pluck(:comment_id))
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all
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
