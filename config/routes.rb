Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index]  
end
resources :posts, only: [:new, :create, :show, :destroy] do 
  resources :comments, only: [:new, :create]
  resources :likes, only: [ :create]
end
resources :comments, only: [:destroy]
resources :likes, only: [:destroy]

root "home#index"
end