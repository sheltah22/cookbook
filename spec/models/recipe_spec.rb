require 'rails_helper'

describe Recipe do
  before(:each) do
    @user = User.create(name: "Example User", email: "user@example.com",
                        password: "foobarbar", password_confirmation: "foobarbar")
    @dish_type = DishType.create(name: "Entree")
    @recipe = @user.recipes.build(title: "Recipe 1", content: "This is a recipe.",
                                  dish_type: @dish_type)
  end

  it "should be valid" do
    expect(@recipe).to be_valid
  end

  it "user id should be present" do
    @recipe.user_id = nil
    expect(@recipe).to_not be_valid
  end

  it "title should be present" do
    @recipe.title = "  "
    expect(@recipe).to_not be_valid
  end

  it "content should be present" do
    @recipe.content = "  "
    expect(@recipe).to_not be_valid
  end

  it "order should be most recent first" do
    @recipe.save
    @recent = @user.recipes.create(title: "Most Recent", content: "Lorem ipsum",
                                   dish_type: @dish_type)
    expect(Recipe.first).to eq(@recent)
  end

  it "dependent ingredients should be destroyed" do
    @recipe.save
    @food = Food.create(name: "flour")
    @measurement = Measurement.create(name: "cup")
    @recipe.ingredients.create(food: @food, amount: 1.33, measurement: @measurement)
    expect { @recipe.destroy }.to change(Ingredient, :count).by(-1)
  end
end
