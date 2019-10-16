class CookbookController < ApplicationController
  include CookbookHelper
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

  def add_recipe
  end

  def advanced_search
  end

  def saved_recipes
  end
end
