Rails.application.routes.draw do

  root 'coordinates#index'
  devise_for :users

  resources :users, only: [:show]

end
