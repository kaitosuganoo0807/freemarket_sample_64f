Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :mypages, only: :index
  resources :users, only: [:edit, :update]
  resources :items, only: [:index, :new]

  # 仮置き
  get 'items/show', to: 'items#show'
end