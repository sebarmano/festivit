Rails.application.routes.draw do
  resources :submissions

  root 'welcome#index'

  devise_for :users

  resources :users, only: [:new, :create]
  resources :admins, controller: 'users', only: [:new, :create], type: 'Admin'
  resources :volunteers, controller: 'users', only: [:new, :create], type: 'Volunteer'
end
