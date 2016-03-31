Rails.application.routes.draw do
  resources :users
  # root 'users#index'
  root 'homes#index'
  get "homes/index"
  namespace :position_system do
    resources :devices
  end

  mount Dispatch => "/api"
end
