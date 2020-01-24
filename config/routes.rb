Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :genres, only: :index do 
    resources :contents, only: :index
  end
end
