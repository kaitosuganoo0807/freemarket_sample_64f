Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :mypages, only: :index
  resources :users, only: [:edit, :update, :destroy]
  resources :items, only: [:index, :new, :create, :edit, :update]

  

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
      post 'authentication'
      post 'address'
      post 'credit'
      post 'completed'
    end
  end
end