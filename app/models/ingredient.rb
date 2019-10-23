class Ingredient < ApplicationRecord
  belongs_to :food
  belongs_to :measurement
  belongs_to :recipe

  validates :amount, presence: true

  def as_string
    @food = self.food
    @amount = self.amount
    @measurement = self.measurement
    if (@amount == 1)
      @count = 1
    else
      @count = 2
    end
    "#{@amount.truncate(2)} #{measurement.name.pluralize(@count)} #{food.name}"
  end
end
