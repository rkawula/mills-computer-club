MillsComputerClub::Application.routes.draw do

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
