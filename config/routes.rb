Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :users, only: [:show] do
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update] do
    resources :comments, only: [:create]
  end

end
