Rails.application.routes.draw do
  resource :users, only: [:show, :edit, :update]
  root to: 'homes#top'
  devise_for :users
end
