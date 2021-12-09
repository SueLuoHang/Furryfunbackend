Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :services
      device_scope :user do
        post 'login', to: 'user_sessions#create', as: 'login'
      end
      put 'users/update', to: 'users#update'

    end
  end
end
