class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  attachment :post_image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  enum genre: { "いぬ": 0, "ねこ": 1, "アクア": 2, "小動物・鳥": 3, "爬虫類・両生類": 4, "昆虫": 5, "その他": 6 }
end
