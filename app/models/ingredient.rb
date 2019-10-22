class Ingredient < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  validates :recipe_id, presence: true
  validates :food_id, presence: true
  validates :amount, presence: true
end
