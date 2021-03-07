class ChatMessagesController < ApplicationController
  
  def create
    @chat_message = current_user.chat_messages.new(chat_message_params)
    @chat_message.save
    redirect_to request.referer
  end
  
  private
  
  def chat_message_params
    params.require(:chat_message).permit(:message, :room_id)
  end
  
  
end