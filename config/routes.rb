Rails.application.routes.draw do
  resources :merchants
  devise_for :users, skip: [:registrations]
  root to: 'merchants#index'
end
