class Ingredient < ApplicationRecord
  belongs_to :food
  belongs_to :measurement
  belongs_to :recipe

  validates :amount, presence: true
end
