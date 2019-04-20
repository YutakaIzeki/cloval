Rails.application.routes.draw do

  root 'coordinates#index'
  devise_for :users

  resources :users, only: [:show]

  resources :coordinates, only: [:show,:new,:create]

end
