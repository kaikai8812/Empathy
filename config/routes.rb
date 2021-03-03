Rails.application.routes.draw do
  root to: 'homes#top'
  resource :users, only: [:show, :edit, :update]
  resources :troubles  #trounles, まだsearchは入れていません。
  devise_for :users
end
