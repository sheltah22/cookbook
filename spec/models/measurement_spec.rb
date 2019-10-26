require 'rails_helper'

describe Measurement do
  before(:each) do
    @variety = Variety.create(name: "Volume")
    @measurement = @variety.measurements.create(name: "cup")
  end

  it "should be valid" do
    expect(@measurement).to be_valid
  end

  it "name should be present" do
    @measurement.name = "   "
    expect(@measurement).to_not be_valid
  end

  it "name should be unique" do
    @new_measurement = @variety.measurements.build(name: "cup")
    expect(@new_measurement).to_not be_valid
  end

  it "variety should be present" do
    @measurement.variety = nil
    expect(@measurement).to_not be_valid
  end

  it "saves name as lowercase" do
    @measurement.name = "cUP"
    @measurement.save
    expect(@measurement.name).to eq("cup")
  end

  it "ingredients are destroyed with measurement" do
    @food = Food.new(name: "flour")
    @food.varieties << @variety
    @food.save
    @user = User.create(name: "Example User", email: "user@example.com",
                        password: "foobarbar", password_confirmation: "foobarbar")
    @dish_type = DishType.create(name: "Entree")
    @recipe = @user.recipes.create(title: "Recipe 1", content: "This is a recipe.",
                                  dish_type: @dish_type)
    @recipe.ingredients.create(food: @food, amount: 1.33, measurement: @measurement)
    expect { @measurement.destroy }.to change(Ingredient, :count).by(-1)
  end
end
