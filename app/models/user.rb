class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  enum age: { "10代": 0, "20代": 1, "30代": 2, "40代": 3, "50代": 4, "60代": 5, "70代以上": 6 }
  enum gender: { 男性: 0, 女性: 1 }
end
