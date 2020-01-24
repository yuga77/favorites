Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :genres, only: [:index, :show] do 
    resources :contents, only: [:index, :new, :create]
  end
  resources :users, only: [:edit, :update]

end
