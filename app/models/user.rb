class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :profile_image  #プロフィール画像設定
  
  #アソシエーション関係
  has_many :troubles, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  
  
  
end
