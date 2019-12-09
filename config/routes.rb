Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  
  # 仮置き
  get 'items/show', to: 'items#show'
end
