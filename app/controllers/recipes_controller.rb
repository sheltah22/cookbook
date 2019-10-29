class RecipesController < ApplicationController

  def new
    @recipe = current_user.recipes.build
    @ingredients = @recipe.ingredients.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe saved!"
      redirect_to browse_url
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
  end

  def add_ingredient_form
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :dish_type_id, :content, ingredients_attributes: [])
  end

end
