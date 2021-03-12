class AddCommentIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :comment_id, :integer
  end
end
