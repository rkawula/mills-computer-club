Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Routes for logging in and out through Google.
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get '/users/profile', to: 'users#profile'

  post '/users/profile', to: 'users#edit_profile', as: 'edit_profile'

  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:index, :show, :destroy]
  
  resources :post, only: [:index, :show]

  get '/hackathon', to: 'hackathon#current', as:'current_hackathon'

  get '/hackathon/tentative-teams', to: 'teams#tentative', as: 'tentative_teams'

  get '/hackathon/faq', to: 'hackathon#faq', as: 'faq'

  # Add /past-hackathons later, rerouting to index.
  
  resources :hackathon, only: [:show] do
    resources :teams, only: [:index, :show, :new, :create]
    resources :sponsors, only: [:index]
  end

  resources :admin, only: [:index]

  namespace :admin do
    resources :officers, only: [:index]
  end

  root to: 'welcome#index'
  get '/calendar', to: 'welcome#calendar'
  get '/resources', to: 'welcome#resources'
  get '/media', to: 'welcome#media'
  get '/authors', to: 'welcome#authors'

end
