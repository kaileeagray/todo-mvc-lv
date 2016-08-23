Rails.application.routes.draw do

  get '/auth/:provider/callback' => 'sessions#create'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :lists do
    resources :items, :only => [:create]
  end

  root 'lists#index'

end
