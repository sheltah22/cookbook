class AddDishTypeToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipes, :dish_type, foreign_key: true
  end
end
