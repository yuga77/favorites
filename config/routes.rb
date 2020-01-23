Rails.application.routes.draw do
  devise_for :users
  get 'genres/index'

  root 'genres#index'
end
