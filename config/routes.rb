Rails.application.routes.draw do
  resources :users
  root 'users#index'

  mount Dispatch => "/api"
end
