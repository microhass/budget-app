Rails.application.routes.draw do
  devise_for :users

  resources :groups, only: %i[index show new create] do
    resources :entities, only: %i[create new]
  end

 get '/groups/:group_id/entities/new_form', to: 'entities#new', as: 'new_group_entity_form'
 
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
