Rails.application.routes.draw do
  root 'pictures#index'
  resources :users, path: 'profile', only: [:show]
  resources :pictures do
    resources :tags, only: [:new, :create]
  end
  resources :tags, only: [:index]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
