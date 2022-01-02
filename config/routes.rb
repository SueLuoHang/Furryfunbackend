Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :pets do
        resources :bookings
      end
      resources :users, only: [:show]
      resources :services
      devise_scope :user do
        post 'login', to: 'users#login'
      end
      put 'users/update', to: 'users#update'
    end
  end
end
