class Variety < ApplicationRecord
  has_and_belongs_to_many :foods
  has_many :measurements, dependent: :destroy

  before_save { self.name = name.humanize(capitalize: true) }

  before_destroy :destroy_one_variety_foods

  validates :name, presence: true,
            uniqueness: { case_sensitive: false }

  def destroy_one_variety_foods
    self.foods.all.each do |food|
      if food.varieties.count == 1
        food.destroy
      end
    end
  end
end
