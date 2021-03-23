class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @posts = Post.page(params[:page]).per(3)
    @comments = Comment.find(Favorite.group(:comment_id).order('count(comment_id) desc').limit(1).pluck(:comment_id))
    @all_ranks = Comment.find(Favorite.group(:comment_id).order('count(comment_id) desc').limit(5).pluck(:comment_id))
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all.order(created_at: :desc)
    @comments = Comment.page(params[:page]).per(5)
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      redirect_to user_path(current_user), notice: '写真を選択してください'
    end
  end

  def search
    @search = Post.search(params[:search])
    @searches = @search.all.order(created_at: :desc)
    @searches = @search.page(params[:page]).per(6)
  end

  private

  def post_params
    params.require(:post).permit(:post_image, :genre)
  end
end
