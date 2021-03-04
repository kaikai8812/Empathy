class PostComment < ApplicationRecord
  #バリデーション
  validates :comment, presence: true
  
  #アソシエーション
  belongs_to :user
  belongs_to :trouble
  has_many :likes, dependent: :destroy
  
  #いいね済みか判断するメソッド  true => いいねあり false => いいねなし
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
end
