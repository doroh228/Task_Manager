Rails.application.routes.draw do
  get '/register', to: 'users#new'
  resources :users, :roles, :priorities
  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'
  resources :sessions, only: [:create]
end
