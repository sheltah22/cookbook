class RecipesController < ApplicationController

  def new
    @recipe = current_user.recipes.build
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

  private

  def recipe_params
    params.require(:recipe).permit(:title, :dish_type_id, :content)
  end

end
