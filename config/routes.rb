Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get 'profile', to: 'pages#profile'
  patch 'profile', to: 'pages#profile'
  get 'reservation', to: 'pages#reservation'
  # patch 'reservation', to: 'pages#reservation'

  resources :gears, only: %i[index new create]
end
