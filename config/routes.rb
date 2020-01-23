Rails.application.routes.draw do
  get 'genres/index'

  root 'genres#index'
end
