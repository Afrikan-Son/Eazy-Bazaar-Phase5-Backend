# frozen_string_literal: true

Rails.application.routes.draw do
  resources :order_details, only: [:create]
  resources :reviews
  resources :riders
  resources :products
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/admin_action', to: 'admin#admin_action'
      resources :users, only: [:create] do
        resources :orders, only: %i[create index]
      end
    end
  end
end
