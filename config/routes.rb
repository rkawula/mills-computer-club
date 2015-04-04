MillsComputerClub::Application.routes.draw do

  root to: 'welcome#index'
  resources :sessions, only: :index
  match '/test_session', :to => 'sessions#new'
  get '/auth/:provider/callback' => 'sessions#create'
  # Routes for our html pages to show up.
  match '/index', :to => 'welcome#index'
  match '/blog', :to => 'welcome#blog'
  match '/events', :to => 'welcome#events'
  match '/projects', :to => 'welcome#projects'
  match '/resources', :to => 'welcome#resources'
  match '/achievements', :to => 'welcome#achievements'


end
