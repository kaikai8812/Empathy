class ChatMessage < ApplicationRecord
  
  has_many :notifications, dependent: :destroy
  
  belongs_to :user
  belongs_to :room
  
  #チャットメッセージ送信の通知メソッド
  def create_notification_chat!(current_user, visited_id)
    notification = current_user.active_notifications.new(
      visited_id: visited_id,
      chat_message_id: id,
      action: 'chat'
      )
    notification.save
    # binding.pry
  end
  
  
end
