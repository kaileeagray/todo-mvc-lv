Rails.application.routes.draw do
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  post '/sessions/create' => "lists#index"

  get '/logout' => "sessions#destroy"
  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/github/callback' => 'sessions#create'

  get 'items/create'
  resources :users, :only => [:new, :create]
  resources :lists do
    resources :items
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'lists#index'

end
