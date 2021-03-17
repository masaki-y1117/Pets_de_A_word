class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  attachment :post_image

  enum genre: { "いぬ": 0, "ねこ": 1, "アクア": 2, "小動物・鳥": 3, "爬虫類・両生類": 4, "昆虫": 5, "その他": 6 }
  
  def self.search(search)
    return Post.all unless search
    Post.where(['genre LIKE ?', "%#{search}%"])
  end
end
