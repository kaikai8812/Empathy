class Like < ApplicationRecord
  #アソシエーション
  belongs_to :user
  belongs_to :post_comment
end
