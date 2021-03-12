class FavoritesController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    favorite = current_user.favorites.new(post_id: @post.id)
    favorite = current_user.favorites.new(comment_id: @comment.id)
    favorite.save
    redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite = favorite.find_by(comment_id: @comment.id)
    favorite.destroy
    redirect_to post_path(@post)
  end
end
