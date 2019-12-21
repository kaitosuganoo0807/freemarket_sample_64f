Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "items#index"
  resources :mypages, only: :index
  resources :users, only: [:edit, :update, :destroy]
  resources :card,only:[:index]
  resources :card,only:[:create]
  resources :searches,only:[:index]

  
  resources :items do
    resources :comments, only: [:create, :destroy]
    resources :images do
    end
  end

  get '/mypage/identification', to: 'mypages#identification'
  get '/mypage/profile', to: 'mypages#profile'
  get '/mypage/card', to: 'mypages#card'
  get '/mypage/card/new', to: 'mypages#card_new'
  get 'mypage/destroy', to: 'mypages#destroy'
  delete '/card/destroy', to: 'card#destroy'
  get '/searches/detail_search', to: 'searches#detail_search'
  get '/category/:id',to: 'category#category'
  get '/category2/:id',to: 'category#category2'
  get '/category3/:id',to: 'category#category3'
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

  resources :items,only:[:show] do
    get 'card/pay', to: 'card#pay'
    get 'card/confirmation', to:'card#confirmation'
    get 'card/complete', to:'card#complete'
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
    end
  end
end
