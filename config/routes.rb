Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get 'profile', to: 'pages#profile'
  patch 'profile', to: 'pages#profile'
  get 'reservations', to: 'pages#reservation'
  patch 'reservation', to: 'pages#reservation'
  get 'profile', to: 'users#profile', as: 'user_profile'
  get 'gears/:id', to: 'gears#show', as: 'gear'
  # post '/reservations', to: 'reservations#create', as: 'create_reservation'
  get '/reservations', to: 'reservations#index', as: 'user_reservations'
  post 'gears/:id/reservations', to: 'reservations#create', as: 'create_reservation'

  resources :gears, only: %i[index new create]
  resources :gears, only: [:show]
end
