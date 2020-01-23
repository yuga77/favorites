Rails.application.routes.draw do
  devise_for :users
  root 'genres#home'
end
