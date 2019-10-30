Rails.application.routes.draw do
  root 'cookbook#home'
  get '/home', to: 'cookbook#home'
  get '/browse', to: 'cookbook#browse'
  get '/advanced_search', to: 'cookbook#advanced_search'
  get '/saved_recipes', to: 'cookbook#saved_recipes'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/add_recipe', to: 'recipes#new'
  post '/add_recipe', to: 'recipes#create'
  resources :recipes
end
