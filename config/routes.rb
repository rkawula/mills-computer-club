MillsComputerClub::Application.routes.draw do

  # Routes for logging in and out through Google.
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get '/users/profile', to: 'users#profile'

  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:index, :show, :destroy]

  root to: 'welcome#index'

  # Routes for our static pages to show up.
  match '/index', :to => 'welcome#index'
  match '/blog', :to => 'welcome#blog'
  match '/events', :to => 'welcome#events'
  match '/projects', :to => 'welcome#projects'
  match '/resources', :to => 'welcome#resources'
  match '/achievements', :to => 'welcome#achievements'
  match '/authors', :to => 'welcome#authors'


end
