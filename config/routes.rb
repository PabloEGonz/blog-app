Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index]  
end
resources :posts, only: [:new, :create, :show] do 
  resources :comments, only: [:new, :create]
  resources :likes, only: [ :create]
end
end