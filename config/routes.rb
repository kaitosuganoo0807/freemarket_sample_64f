Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "items#index"
  resources :mypages, only: :index
  resources :users, only: [:edit, :update, :destroy]
  resources :items, only: [:index, :new]

  

  # 仮置き
  get 'card/confirmation', to:'card#confirmation'
  get 'mypages/destroy', to: 'mypages#destroy'
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