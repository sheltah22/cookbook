class RecipesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @recipe = current_user.recipes.build
    @ingredients = @recipe.ingredients.build
  end

  def create
    urp = updated_recipe_params
    @recipe = current_user.recipes.create(urp)
    if @recipe.save(urp)
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
    if @recipe.update(updated_recipe_params)
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
                                   ingredients_attributes: [:id, :amount, :measurement, :food, :_destroy])
  end

  def updated_recipe_params
    recipe_params_final = recipe_params
    recipe_params_final[:ingredients_attributes].values.each do |ingredient|
      new_measurement = Measurement.find_by(name: ingredient[:measurement].downcase)
      if new_measurement.nil?
        new_measurement = Measurement.find_by(name: ingredient[:measurement].downcase.singularize)
      end
      new_food = Food.find_by(name: ingredient[:food].downcase)
      if new_food.nil?
        new_food = Food.find_by(name: ingredient[:food].downcase.pluralize)
      end
      ingredient[:measurement] = new_measurement
      ingredient[:food] = new_food
    end
    return recipe_params_final
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in to access this page."
      redirect_to login_url
    end
  end

  def correct_user
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe
      @user = @recipe.user
      redirect_to(root_url) unless current_user?(@user)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
