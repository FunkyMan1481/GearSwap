Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get 'profile', to: 'pages#profile'
  patch 'profile', to: 'pages#profile'
  get '/reservations', to: 'reservations#index'
  patch 'reservation', to: 'reservation#index'

  resources :gears, only: %i[index new create]

end
