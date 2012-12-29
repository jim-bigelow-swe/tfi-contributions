Contributions::Application.routes.draw do

  resources :contribution_records

  resources :candidates
  resources :contributions
  resources :contributor_names
  resources :contributor_addresses

  get "home/index"

  root :to => 'home#index'

end
