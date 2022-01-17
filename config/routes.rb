Rails.application.routes.draw do
  # devise_for :users
  # root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :show, :update, :create] do
        resources :pets, only: [:create, :update, :destroy]
        resources :bookings, shallow: true
      end
      resources :pets, only:[:index, :show] do
        member do
          post '/update_photo', to: 'pets#update_photo'
        end
      end
        post '/login', to: 'users#login'
      resources :services
    end
  end
end
