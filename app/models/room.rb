class Room < ApplicationRecord
  has_many :chat_messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  belongs_to :post_comment
end
