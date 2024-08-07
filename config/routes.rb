Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users
  resources :campaigns
  resources :trades, only: [:create]
end
