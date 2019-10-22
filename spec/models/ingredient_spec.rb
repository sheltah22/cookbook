require 'rails_helper'

describe Ingredient do
  before(:each) do
    @user = User.create(name: "Example User", email: "user@example.com",
                        password: "foobarbar", password_confirmation: "foobarbar")
    @dish_type = DishType.create(name: "Entree")
    @recipe = @user.recipes.create(title: "Recipe 1", content: "This is a recipe.",
                                    dish_type: @dish_type)
    @food = Food.create(name: "Flour")
    @ingredient = @recipe.ingredients.build(food: @food, amount: 1.5)
  end

  it "should be valid" do
    expect(@ingredient).to be_valid
  end

  it "recipe should be present" do
    @ingredient.recipe_id = nil
    expect(@ingredient).to_not be_valid
  end

  it "food should be present" do
    @ingredient.food_id = nil
    expect(@ingredient).to_not be_valid
  end

  it "amount should be present" do
    @ingredient.amount = nil
    expect(@ingredient).to_not be_valid
  end
end
