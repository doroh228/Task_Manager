Rails.application.routes.draw do
  get '/tasks/my', to: 'tasks#users_tasks'
  get '/', to: 'main_views#show'
  get '/register', to: 'users#new'
  post 'tasks/assign/:id', to: 'tasks#assign'
  resources :users, :roles, :priorities, :tasks
  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'
  resources :sessions, only: [:create]
end
