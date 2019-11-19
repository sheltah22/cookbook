class Ingredient < ApplicationRecord
  belongs_to :food
  belongs_to :measurement
  belongs_to :recipe

  validate :validate_food_and_measurement_variety_must_match
  validates :amount, presence: true

  def validate_food_and_measurement_variety_must_match
    unless food.nil? || measurement.nil?
      variety = measurement.variety
      food.varieties.all
      unless food.varieties.exists?(variety.id)
        errors.add(:measurement,
                   "Measurement must be appropriate for food:"\
                   "Please change your measurement for #{food.name} from #{measurement.name.pluralize} to one "\
                   "that measures in terms of "\
                   "#{food.varieties.all.to_a.map { |e| e.name.downcase }.join(' or ')}")
      end
    end
  end

  def as_string
    food = self.food
    amount = self.amount
    measurement = self.measurement
    if (amount == 1)
      count = 1
    else
      count = 2
    end
    "#{amount.truncate(2)} #{measurement.name.pluralize(count)} #{food.name}"
  end
end
