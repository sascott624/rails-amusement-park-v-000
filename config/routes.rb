Rails.application.routes.draw do

  root "static#welcome"
  resources :users
  resources :attractions

  get 'signin', to: 'sessions#new'
  post "/sessions/create", to: "sessions#create"
  get 'logout', to: 'sessions#destroy'
  post "/rides/new", to: "rides#new"

end
