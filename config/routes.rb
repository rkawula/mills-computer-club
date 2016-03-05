MillsComputerClub::Application.routes.draw do

  # Routes for logging in and out through Google.
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get '/users/profile', to: 'users#profile'

  post '/users/profile', to: 'users#edit_profile', as: 'edit_profile'

  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:index, :show, :destroy]
  
  resources :post, only: [:index, :show]
  
  resources :hackathon, only: [:show] do
    resources :teams, only: [:index, :show]
  end

  root to: 'welcome#index'

  # Routes for our static pages to show up.
  match '/index', :to => 'welcome#index'
  match '/events', :to => 'welcome#events'
  match '/resources', :to => 'welcome#resources'
  match '/media', :to => 'welcome#media'
  match '/authors', :to => 'welcome#authors'


end
