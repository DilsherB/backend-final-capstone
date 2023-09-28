Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'api/v1/home#index'
  namespace :api do
    namespace :v1 do
      get '/', to: 'home#index'
      get 'home', to: 'home#index'
      resources :sessions, only: [:create, :destroy]
    end
  end
end
