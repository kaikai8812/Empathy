class Trouble < ApplicationRecord
  
  belongs_to :category #dependent: :destroyは、つけてません。
  
  validates :title, presence: true
  validates :content, presence: true
  
end
