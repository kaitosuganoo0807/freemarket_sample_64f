Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :mypages, only: :index
  
  # 仮置き
  get 'items/show', to: 'items#show'
  get 'items/new', to: 'items#new'
end
