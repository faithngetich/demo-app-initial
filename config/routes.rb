Rails.application.routes.draw do
  # Authy
  post "authy/callback" => 'authy#callback'
  get "authy/status" => 'authy#one_touch_status'
  # Account section
  resource :account, only: [:show]
  get 'accounts/show'
   # Sessions
  resources :sessions, only: [:new, :create]
  delete "sessions/destroy"
  # Create users
  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
