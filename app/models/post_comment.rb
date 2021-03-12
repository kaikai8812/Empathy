class PostComment < ApplicationRecord
  #バリデーション
  validates :comment, presence: true
  
  #アソシエーション
  belongs_to :user
  belongs_to :trouble
  has_many :likes, dependent: :destroy
  has_one :room, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  #いいね済みか判断するメソッド  true => いいねあり false => いいねなし
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
  #いいね通知の作成メソッド
  def create_notification_like!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_comment_id = ? and action = ?", current_user.id, user_id, id, 'like' ])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: user_id,
        post_comment_id: id,
        action: 'like'
        )
        # binding.pry
      notification.save
    end
  end
  
  #コメント投稿の通知メソッド
  def create_notification_comment!(post_comment_user, trouble_user_id)
    temp = Notification.where(["post_comment_id = ? and action = ?", id, 'comment'])  #同じ通知を何回も繰り返さないため。
    if temp.blank?
      notification = post_comment_user.active_notifications.new(
        visited_id: trouble_user_id,
        post_comment_id: id,
        action: 'comment'
        )
      # binding.pry
      notification.save
    end
  end
  
  def chat_message(user)
    self.room.chat_messages.where(user_id: user.id)
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
