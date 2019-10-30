class RecipesController < ApplicationController

  def new
    @recipe = current_user.recipes.build
    @ingredients = @recipe.ingredients.build
  end

  def create
    @recipe = current_user.recipes.create(recipe_params)
    if @recipe.save(recipe_params)
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
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe Updated"
      redirect_to browse_url
    else
      render :edit
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :dish_type_id, :content,
                                   ingredients_attributes: [:id, :amount, :measurement_id, :food_id, :_destroy])
  end

end
