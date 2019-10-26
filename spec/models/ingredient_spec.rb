require 'rails_helper'

describe Ingredient do
  before(:each) do
    @user = User.create(name: "Example User", email: "user@example.com",
                        password: "foobarbar", password_confirmation: "foobarbar")
    @dish_type = DishType.create(name: "Entree")
    @recipe = @user.recipes.create(title: "Recipe 1", content: "This is a recipe.",
                                   dish_type: @dish_type)
    @variety = Variety.create(name: "Volume")
    @food = Food.new(name: "Flour")
    @food.varieties << @variety
    @food.save
    @measurement = @variety.measurements.create(name: "cup")
    @ingredient = @recipe.ingredients.build(food: @food, amount: 1.5,
                                            measurement: @measurement)
  end

  it "should be valid" do
    expect(@ingredient).to be_valid
  end

  it "recipe should be present" do
    @ingredient.recipe = nil
    expect(@ingredient).to_not be_valid
  end

  it "food should be present" do
    @ingredient.food = nil
    expect(@ingredient).to_not be_valid
  end

  it "amount should be present" do
    @ingredient.amount = nil
    expect(@ingredient).to_not be_valid
  end

  it "measurement should be present" do
    @ingredient.measurement = nil
    expect(@ingredient).to_not be_valid
  end

  it "measurement should match with food" do
    new_variety = Variety.create(name: "unit")
    new_measurement = new_variety.measurements.create(name: "unit")
    @ingredient.measurement = new_measurement
    expect(@ingredient).to_not be_valid
  end
end
