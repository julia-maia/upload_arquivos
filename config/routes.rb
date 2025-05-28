Rails.application.routes.draw do
  resources :items
  resources :purchasers
  resource :session
  resources :passwords, param: :token
  get "purchases/index"
  root "imports#new"

  resources :imports
  resources :purchases
  resources :users

  get "up" => "rails/health#show", as: :rails_health_check
end
