require 'rails_helper'

describe Food do
  before(:each) do
    @variety = Variety.create(name: "Weight")
    @food = Food.new(name: "flour")
    @food.varieties << @variety
    @food.save
  end

  it "should be valid" do
    expect(@food).to be_valid
  end

  it "name should be present" do
    @food.name = "   "
    expect(@food).to_not be_valid
  end

  it "name should be unique" do
    @new_food = @variety.foods.build(name: "flour")
    expect(@new_food).to_not be_valid
  end

  it "variety should be present" do
    @food.varieties.clear
    expect(@food).to_not be_valid
  end

  it "saves name as lowercase" do
    @food.name = "flOuR"
    @food.save
    expect(@food.name).to eq("flour")
  end

  it "ingredients are destroyed with food" do
    @measurement = @variety.measurements.create(name: "pounds")
    @user = User.create(name: "Example User", email: "user@example.com",
                        password: "foobarbar", password_confirmation: "foobarbar")
    @dish_type = DishType.create(name: "Entree")
    @recipe = @user.recipes.create(title: "Recipe 1", content: "This is a recipe.",
                                   dish_type: @dish_type)
    @recipe.ingredients.create(food: @food, amount: 1.33, measurement: @measurement)
    expect { @food.destroy }.to change(Ingredient, :count).by(-1)
  end

  it "food can have multiple varieties" do
    new_variety = Variety.create(name: "Volume")
    @food.varieties << new_variety
    expect(@food).to be_valid
  end
end
