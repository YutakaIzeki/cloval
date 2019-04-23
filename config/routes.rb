Rails.application.routes.draw do

  root 'coordinates#index'
  devise_for :users

  get 'coordinates/index/:kind' => 'coordinates#index'

  resources :users, only: [:show]
  resources :coordinates, only: [:show,:new,:create,:update]

end
