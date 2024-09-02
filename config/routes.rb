Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users
  resources :campaigns
  resources :trades, only: [:create]

  get '/reports/campaigns/index/(:option)', to: 'campaigns_report#index', defaults: { format: :pdf }
  get '/reports/campaigns/characters/(:option)', to: 'reports#character_player_by_campaign', defaults: { format: :pdf }
end
