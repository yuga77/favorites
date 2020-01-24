Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :genres, only: :index do 
    resoureces :contents, only[:index]
  end
end
