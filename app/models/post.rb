class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  attachment :post_image
  validates :post_image, presence: true
  enum genre: { "いぬ": 0, "ねこ": 1, "アクア": 2, "小動物・鳥": 3, "爬虫類・両生類": 4, "昆虫": 5, "その他": 6 }

  def self.search(search)
    return Post.all unless search
    Post.where(genre: search)
  end
  
  #投稿一覧ページで投稿写真に対する笑い数がもっとも多い1件を表示
  def best_favorites_comment
    Comment.where(post_id: self.id).select('comments.*', 'count(favorites.id) AS favs').left_joins(:favorites).group('comments.id').order('favs desc').first
  end
end
