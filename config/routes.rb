Rails.application.routes.draw do
  resources :tickets do
    collection { post :import }
  end

  root 'welcome#index'

  devise_for :users

  resources :admins, controller: 'users', only: [:new, :create], type: 'Admin'
  resources :volunteers, controller: 'users', only: [:new, :create], type: 'Volunteer'

  resources :participants, only: [:new, :create, :edit, :show, :index] do
    resources :submissions, except: :index
    collection { post :import }
  end

  get 'submissions', to: 'submissions#index'

  post 'approve/:id', to: 'submissions#approve'

  resources :tickets do
    collection { post :import }
    collection { put :pick_up }
  end
end
