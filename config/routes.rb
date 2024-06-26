Rails.application.routes.draw do
  get 'campaings/index'
  get 'campaings/show'
  get 'campaings/new'
  get 'campaings/create'
  get 'campaings/edit'
  get 'campaings/update'
  get 'campaings/destroy'
  get 'characters/index'
  get 'characters/show'
  get 'characters/new'
  get 'characters/create'
  get 'characters/edit'
  get 'characters/update'
  get 'characters/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
