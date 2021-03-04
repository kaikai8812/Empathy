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
  
  #いいね数に応じて、コメントの表示ステータスをtrueにするメソッド。
  def comment_display_true
    if self.likes.count >= 2
      self.update_attributes(is_displayed: true)
    end
  end
  
  #いいね数に応じて、コメントの表示ステータスをfalseにするメソッド。
  def comment_display_false
    if self.likes.count < 2
      self.update_attributes(is_displayed: false)
    end
  end
  
end
