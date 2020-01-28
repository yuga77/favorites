Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :genres, only: [:index, :show] do 
    resources :contents, only: [:index, :create, :show] do
      resources :details, only: [:index, :create]
    end
  end
  resources :users, only: [:show, :edit, :update]

end
