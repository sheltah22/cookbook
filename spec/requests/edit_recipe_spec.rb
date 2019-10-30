require 'rails_helper'

describe "Edit Recipe" do

  it "successfully edits exiting recipe" do
    dish_type = DishType.create(name: "Entree")
    recipe = logged_in_user.recipes.create(title: "Recipe 1", content: "Content", dish_type: dish_type)
    get edit_recipe_path(recipe)
    expect do
      patch recipe_path, params: { recipe: { title: "My favorite recipe",
                                             content: "Updated content",
                                             dish_type: dish_type }}
    end.not_to change { User.count }
    follow_redirect!
    expect(response).to render_template('browse')
  end
end
