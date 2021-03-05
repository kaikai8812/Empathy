class Room < ApplicationRecord
  has_many :chat_messages
  has_many :entries
  belongs_to :post_comment
end
