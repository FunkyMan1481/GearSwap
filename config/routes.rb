Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get 'profile', to: 'pages#profile'


  resources :gears, only: %i[index new create show] do
    resources :reservations, only: %i[new create]
  end
  resources :reservations, only: [:destroy]
end
