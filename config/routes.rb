Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  resources :admins, controller: 'users', only: [:new, :create], type: 'Admin'
  resources :volunteers, controller: 'users', only: [:new, :create], type: 'Volunteer'
  resources :applicants, controller: 'users', only: [:show], type: 'Applicant'

  resources :participants, only: [:new, :create, :edit, :show, :index] do
    resources :submissions, except: :index
    collection {
      get :import
      post :import
    }
  end

  resources :submissions

  get 'submissions', to: 'submissions#index'
  post 'approve/:id', to: 'submissions#approve'
  get 'tickets/import', to: "tickets#import", :as => :import_tickets
  post 'tickets/import', to: "tickets#import"

  resources :tickets do
    collection do
      put :pick_up
      post :import
    end
  end
end
