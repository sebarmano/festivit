Rails.application.routes.draw do
  resources :submissions

  root 'welcome#index'

  devise_for :users

  resources :admins, controller: 'users', only: [:new, :create], type: 'Admin'
  resources :volunteers, controller: 'users', only: [:new, :create], type: 'Volunteer'

  resources :participants, only: [:new, :create, :show, :index] do
    collection {
      get :import
      post :import
    }
  end

  post 'approve/:id', to: 'submissions#approve'

  get 'tickets/import', to: "tickets#import", :as => :import_tickets
  post 'tickets/import', to: "tickets#import"

  resources :tickets do
    collection do
      put :pick_up
    end
  end
end
