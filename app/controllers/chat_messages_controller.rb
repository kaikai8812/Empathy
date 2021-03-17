class ChatMessagesController < ApplicationController
  
  def create
    @chat_message = current_user.chat_messages.new(chat_message_params)
    @chat_message.save
    @trouble = @chat_message.room.post_comment.trouble
    @post_comment = @chat_message.room.post_comment
    
    #チャットの通知作成
    if current_user == @trouble.user 
      @chat_message.create_notification_chat!(current_user, @post_comment.user_id)
    else
      @chat_message.create_notification_chat!(current_user, @trouble.user_id) 
    end
  end
  
  private
  
  def chat_message_params
    params.require(:chat_message).permit(:message, :room_id)
  end
  
  
end