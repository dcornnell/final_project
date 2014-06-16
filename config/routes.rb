Rails.application.routes.draw do
  resources :users do
    collection do 
      get :search
      get :results
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :routes
  resources :attempts
  resources :comments
  resources :tags
  resources :ratings
  resources :friendships
  root 'sessions#new'
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
 
end
