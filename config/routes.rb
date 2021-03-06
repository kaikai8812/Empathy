Rails.application.routes.draw do
  root to: 'homes#top'
  get 'users/my_troubles' => 'troubles#my_index', as: :my_trouble   #ログインユーザの悩み一覧
  resource :users, only: [:show, :edit, :update] 
  
  #悩みの解決ステータス更新のためのアクション
  patch 'troubles/:id/status' => 'troubles#status_update', as: :trouble_status
  resources :post_comments, only: [:index]
  resources :troubles do
    collection do
      get 'search'
    end
    resources :post_comments, only: [:create, :update]
  end
  #get 'post_comments' => 'post_comments#index', as: :post_comments
  
  post 'post_comments/:post_comment_id/likes' => 'likes#create', as: :post_comment_likes
  delete 'post_comments/:post_comment_id/likes' => 'likes#destroy'
  
  resource :chat_messages, only: [:create]
  
  resources :notifications, only: [:index]
  
  
  
  devise_for :users
end
