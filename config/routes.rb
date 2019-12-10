Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :mypages, only: :index
  resources :items, only: [:index, :new]
  resources :signup, only: :index
  # 仮置き
  get 'items/show', to: 'items#show'
  devise_scope :user do
    get 'users/signup/registration', to: 'users/registrations#step1'
  end
end