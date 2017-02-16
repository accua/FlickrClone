Rails.application.routes.draw do
  root 'landing#index'
  resources :users, path: 'profile', only: [:show]
  resources :pictures
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
