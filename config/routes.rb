Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users
  resources :campaigns
  resources :trades, only: [:create]

  get '/reports/campaigns/pdf/(:option)', to: 'campaigns_report#index', defaults: { format: :pdf }
end
