Rails.application.routes.draw do
  root 'posts#index'
  get '/list', to: 'posts#list'
  post '/list', to: 'posts#list'

  devise_for :users
  resources :users, only: [:show, :edit, :update] do
  end

  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

end
