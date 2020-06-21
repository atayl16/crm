Rails.application.routes.draw do
  get 'users/index'
  resources :merchants
  devise_for :users, skip: [:registrations]
  resources :users, except: :create
  post 'create_user' => 'users#create', as: :create_user      

  root to: 'merchants#index'
  match '/users',   to: 'users#index',   via: 'get'
end
