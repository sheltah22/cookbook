require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

describe "Create Recipe" do
  before(:each) do
    @user = User.create(name: "Test User", email: "user@example.com",
                       password: "longpassword", password_confirmation: "longpassword")
    log_in_as(@user)

    @dish_type = DishType.create(name: "Type")
  end

  it "does not add recipe with invalid input" do
    get new_recipe_path
    expect do
      post recipes_path, params: { recipe: { title: "",
                                             user_id: @user.id,
                                             dish_type_id: @dish_type.id,
                                             content: "Lorem ipsum" }}
    end.not_to change { Recipe.count }
    expect(response).to render_template('recipes/new')
  end

  it "adds recipe with valid input" do
    get new_recipe_path
    expect do
      post recipes_path, params: { recipe: { title: "Example Recipe",
                                             user_id: @user.id,
                                             dish_type_id: @dish_type.id,
                                             content: "Lorem Ipsum" }}
    end.to change(Recipe, :count).by(1)
    follow_redirect!
    expect(response).to render_template('cookbook/browse')
  end

  it "adds recipe with ingredient" do
    get new_recipe_path
    variety = Variety.create(name: "variety")
    food = Food.new(name: "food")
    food.varieties << variety
    food.save
    measurement = variety.measurements.create(name: "measurement")
    expect do
      post recipes_path, params:
           { recipe: { title: "Example Recipe",
                       user_id: @user.id,
                       dish_type_id: @dish_type.id,
                       ingredients_attributes: { "0": { amount: 1.0,
                                                        measurement: measurement.name,
                                                        food: food.name }},
                       content: "Lorem Ipsum" }}
    end.to change(Recipe, :count).by(1)
       .and change(Ingredient, :count).by(1)
    follow_redirect!
    expect(response).to render_template('cookbook/browse')
  end
end
