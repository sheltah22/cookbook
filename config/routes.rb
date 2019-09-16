Rails.application.routes.draw do
  get 'cookbook/home'
  get 'cookbook/add_recipe'
  get 'cookbook/advanced_search'
  get 'cookbook/saved_recipes'
  root 'cookbook#home'
end
