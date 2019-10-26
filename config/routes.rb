Rails.application.routes.draw do
  get '/home', to: 'cookbook#home'
  get '/browse', to: 'cookbook#browse'
  get '/add_recipe', to: 'cookbook#add_recipe'
  get '/advanced_search', to: 'cookbook#advanced_search'
  get '/saved_recipes', to: 'cookbook#saved_recipes'


  root 'cookbook#home'

  resources :users
end
