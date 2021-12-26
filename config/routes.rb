Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:show]
        resources :pets
      end
      resources :services do
        resources :bookings, only: [:show, :create, :destroy]
      end
      devise_scope :user do
        post 'login', to: 'users#login'
      end
      put 'users/update', to: 'users#update'
    end
  end
