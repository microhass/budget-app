Rails.application.routes.draw do
  devise_for :users

  resources :groups, only: %i[index show new create]
  resources :entities, only: %i[create new]
 
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
