Rails.application.routes.draw do
  # get 'model/create'
  # get 'model/destroy'
  # get 'model/edit'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # post sign_up_user_tokens_path, to 'devise/api/tokens#sign_up'
  # post '/users', to: 'registrations#create'

  # Defines the root path route ("/")
  root 'api/v1/home#index'
  namespace :api do
    namespace :v1 do
      get '/', to: 'home#index'
      get 'home', to: 'home#index'
      resources :sessions, only: [:create, :destroy]
      resources :users, only: [:create, :update, :destroy]
      resources :model, only: [:index, :create, :update, :destroy]
      resources :car, only: [:index, :create, :update, :destroy]
    end
  end
end
