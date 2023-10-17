Rails.application.routes.draw do
  resources :groups
  resources :entities
  devise_for :users
  resources :users

  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
