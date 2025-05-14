Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  get "purchases/index"
  root "imports#new"

  resources :imports
  resources :purchases
  resources :users

  get "up" => "rails/health#show", as: :rails_health_check
end
