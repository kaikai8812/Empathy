class Trouble < ApplicationRecord
  # アソシエーション関係
  belongs_to :user
  belongs_to :category #dependent: :destroyは、つけてません。
  
  validates :title, presence: true
  validates :content, presence: true
  
end
