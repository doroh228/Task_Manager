Rails.application.routes.draw do
  get 'priorities/index'
  resources :users, :roles, :priorities
end
