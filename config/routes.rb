Rails.application.routes.draw do
  get 'users/first_name'
  get 'users/last_name'
  get 'users/email'
  get 'users/password'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :equiments, only: %i[index new create]
  # Defines the root path route ("/")
  # root "articles#index"
end
