Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :routes
  resources :attempts
  resources :comments
  root 'sessions#new'
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"

  
end
