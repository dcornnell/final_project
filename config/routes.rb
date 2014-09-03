
Rails.application.routes.draw do
  devise_for :users
  resources :users do
    collection do 
      get :search
      get :results
    end
  end
  
  resources :routes
  resources :attempts
  resources :comments
  resources :tags
  resources :ratings
  resources :friendships
  resources :posts
  resources :locations
  root 'posts#index'
 

  get "auth/facebook" => "auth#facebook"
  get "/auth/facebook/callback" => "auth#facebook"
 
end
