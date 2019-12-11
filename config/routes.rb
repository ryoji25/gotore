Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :users, only: [:show] do
  end

  resources :posts, only: [:index, :show, :new, :create] do
  end

end
