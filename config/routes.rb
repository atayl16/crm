Rails.application.routes.draw do
  resources :merchants
  devise_for :users
  root to: 'static#homepage'
end
