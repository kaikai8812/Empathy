class PostComment < ApplicationRecord
  #バリデーション
  validates :comment, presence: true
  
  #アソシエーション
  belongs_to :user
  belongs_to :trouble
  
end
