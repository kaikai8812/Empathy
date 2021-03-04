class Trouble < ApplicationRecord
  # アソシエーション関係
  has_many :post_comments, dependent: :destroy
  belongs_to :user
  belongs_to :category #dependent: :destroyは、つけてません。
  
  validates :title, presence: true
  validates :content, presence: true
  
end
