class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
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
