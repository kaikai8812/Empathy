Rails.application.routes.draw do
  root to: 'homes#top'
  get 'users/my_troubles' => 'troubles#my_index', as: :my_trouble   #ログインユーザの悩み一覧
  resource :users, only: [:show, :edit, :update] 
  
  resources :troubles do   #trounles, まだsearchは入れていません。
    resources :post_comments, only: [:create, :update, :index]
  end
  
  # post 'post_comments/:post_comment_id/likes' => 'likes/create'
  # delete 'post_comments/:post_comment_id/likes' => 'likes/destroy'
  
  
  
  devise_for :users
end
