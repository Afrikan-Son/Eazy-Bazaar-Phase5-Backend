Rails.application.routes.draw do
  resources :order_details, only: [:create]
  resources :reviews
  resources :riders
  resources :products
 namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :users, only: [:create] do
        resources :orders, only: [:create,:index]
      end
    end
  end
end
