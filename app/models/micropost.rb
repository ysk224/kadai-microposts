class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :liked_by, through: :favorites, source: :user
  validates :content, presence: true, length: { maximum: 255 }
  
  def liked_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end