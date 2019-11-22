require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

describe "Edit Recipe" do
  before(:each) do
    @user = User.create(name: "Test User", email: "user@example.com",
                       password: "longpassword", password_confirmation: "longpassword")
    log_in_as(@user)

    @dish_type = DishType.create(name: "Type")
    @recipe = @user.recipes.create(title: "Recipe 1", content: "This is a recipe.",
                                  dish_type: @dish_type)
    @variety = Variety.create(name: "volume")
    @food = Food.new(name: "flour")
    @food.varieties << @variety
    @food.save
    @measurement = @variety.measurements.create(name: "cup")
    @recipe.ingredients.create(food: @food, amount: 1.33, measurement: @measurement)
  end

  it "does not allow wrong user to edit recipe" do
    log_out
    new_user = User.create(name: "New User", email: "newuser@example.com",
                           password: "longpassword", password_confirmation: "longpassword")
    log_in_as(new_user)
    get edit_recipe_path(@recipe)
    expect(response).to redirect_to(root_url)
  end

  it "does not save with invalid changes" do
    get edit_recipe_path(@recipe)
    expect(response).to render_template('recipes/edit')
    patch recipe_path(@recipe), params: {recipe: { title: "",
                                                   user_id: @user.id,
                                                   dish_type_id: @dish_type.id,
                                                   content: "Lorem Ipsum" }}
    @recipe.reload
    expect(@recipe.title).to eq("Recipe 1")
    expect(response).to render_template('recipes/edit')
  end

  it "does save with valid changes" do
    get edit_recipe_path(@recipe)
    expect(response).to render_template('recipes/edit')
    patch recipe_path(@recipe), params:
          { recipe: { title: "New Title",
                      user_id: @user.id,
                      dish_type_id: @dish_type.id,
                                            content: "Lorem Ipsum" }}
    expect(response).to redirect_to(browse_path)
    @recipe.reload
    expect(@recipe.title).to eq("New Title")
  end

  it "saves recipe with new ingredient" do
    new_food = Food.new(name: "New food")
    new_food.varieties << @variety
    new_food.save
    get edit_recipe_path(@recipe)
    expect(response).to render_template('recipes/edit')
    patch recipe_path(@recipe), params:
          { recipe: { title: "New Title",
                      user_id: @user.id,
                      dish_type_id: @dish_type.id,
                      ingredients_attributes: { "1": { amount: 3.5,
                                                       measurement: @measurement.name,
                                                       food: new_food.name }},
                      content: "Lorem Ipsum" }}
    expect(response).to redirect_to(browse_path)
    @recipe.reload
    expect(@recipe.title).to eq("New Title")
    expect(@recipe.ingredients.count).to eq(2)
  end
end
