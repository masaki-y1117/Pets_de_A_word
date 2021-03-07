class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null:false
      t.string :post_image_id, null: false
      t.integer :genre ,null: false, default: 0
      t.timestamps
    end
  end
end
