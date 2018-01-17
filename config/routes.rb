Rails.application.routes.draw do
  resources :users
  resources :attractions

  get '/signup', to: 'users#new'
  get '/signin', to: 'users#signin'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  post '/rides/new', to: 'rides#new'

  root 'welcome#index'

end
