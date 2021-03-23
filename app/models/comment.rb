class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :favorites, dependent: :destroy
  validates :comment, presence: true, length: { maximum: 50 }
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
