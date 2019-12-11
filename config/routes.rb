Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :mypages, only: :index
  resources :items, only: [:index, :new]
  # 仮置き
  get 'items/show', to: 'items#show'
  resources :signup, only: :index do
    collection do
      get 'registration'
      post 'authentication'
      post 'address'
      post 'credit'
      post 'completed'
    end
  end
end