Rails.application.routes.draw do
  resources :users
  # root 'users#index'
  root 'homes#index'
  get "homes/index"
  namespace :position_systems do
    resources :devices
  end

  mount API::Dispatch => "/api"
end
