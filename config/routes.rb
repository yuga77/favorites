Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :genres, only: [:index, :show] do 
    resources :contents, only: [:index, :create, :show, :destroy] do
      resources :details, only: [:index, :create, :destroy]
    end
  end
  resources :users, only: [:show, :edit, :update]

end