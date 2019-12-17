Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :users, only: [:show] do
  end

  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

end
