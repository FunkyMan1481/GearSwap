Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/reservations', to: 'reservations#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :gears, only: %i[index new create]
  # Defines the root path route ("/")
  # root "articles#index"
end
