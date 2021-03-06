class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:post_comment_id])
    favorite = current_user.favorites.new(comment_id: @comment.id)
    favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:post_comment_id])
    favorite = current_user.favorites.find_by(comment_id: @comment.id)
    favorite.destroy
  end
end
