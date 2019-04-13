Rails.application.routes.draw do

  root 'coordinates#index'
  devise_for :users

end
