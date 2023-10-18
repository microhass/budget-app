Rails.application.routes.draw do
  resources :groups
  resources :entities
  devise_for :users

  # make users#splash the root path only if the user is not signed in, else make groups#index the root path
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated do
    root 'users#splash', as: :unauthenticated_root
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
