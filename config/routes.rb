Rails.application.routes.draw do
  get "purchases/index"
  root "imports#new"

  resources :imports
  resources :purchases


  get "up" => "rails/health#show", as: :rails_health_check
end
