Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "items#index"
  resources :mypages, only: :index
  resources :users, only: [:edit, :update, :destroy]
  
  resources :items do
    resources :images do
    end
  end

  

  # 仮置き
  get '/mypages/identification', to: 'mypages#identification'
  get '/mypages/profile', to: 'mypages#profile'
  get '/mypages/card', to: 'mypages#card'
  get '/mypages/card/new', to: 'mypages#card_new'
  get 'card/confirmation', to:'card#confirmation'
  get 'card/completed', to: 'card#completed'
  get 'mypages/destroy', to: 'mypages#destroy'
  get 'items/show', to: 'items#show'
  resources :signup, only: :index do
    collection do
      get 'registration'
      post 'registration_validates'
      get 'authentication'
      post 'authentication_create'
      get 'address'
      post 'address_add'
      get 'credit'
      get 'completed'
    end
  end
end
