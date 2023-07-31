Rails.application.routes.draw do
  resources :reviews, only: [:index, :show, :create] 
  resources :riders, only: [:index, :show] 
  resources :products, only: [:index, :show, :destroy]
 namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
