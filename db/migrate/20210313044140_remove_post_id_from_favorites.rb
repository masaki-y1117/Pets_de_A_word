class RemovePostIdFromFavorites < ActiveRecord::Migration[5.2]
  def up
    remove_column :favorites, :post_id, :integer
  end

  def down
    add_column :favorites, :post_id, :integer
  end
end
