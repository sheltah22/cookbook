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

  def advanced_search
  end

  def saved_recipes
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in to access this page."
      redirect_to login_url
    end
  end
end
