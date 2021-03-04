Rails.application.routes.draw do
  root to: 'homes#top'
  get 'users/my_troubles' => 'troubles#my_index', as: :my_trouble   #ログインユーザの悩み一覧
  resource :users, only: [:show, :edit, :update] 
  resources :troubles   #trounles, まだsearchは入れていません。
  devise_for :users
end
