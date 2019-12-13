class CookbookController < ApplicationController
  include CookbookHelper

  before_action :logged_in_user, only: :saved_recipes

  def home
    @keywords = helpers.random_keywords
    @title = @keywords.join(' ')
    @category = helpers.random_category
    @ingredients = [@keywords[2], @keywords[4]] + helpers.random_ingredients
  end

  def browse
    @recipes = Recipe.all.paginate(page: params[:page], per_page: 10)
    @page = params[:page]
  end

  def saved_recipes
    @recipes = current_user.recipes.paginate(page: params[:page], per_page: 10)
    @page = params[:page]
  end

  def search
  end

  def search_results
    title = params[:query][:title]
    dish_type = params[:query][:dish_type]
    if (title.blank? and dish_type.blank?)
      @recipes = Recipe.all.paginate(page: params[:page], per_page: 10)
    else
      @recipes = Recipe.by_dish_type(dish_type)
                   .search(title)
                   .all
                   .paginate(page: params[:page], per_page: 10)
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in to access this page."
      redirect_to login_url
    end
  end
end
