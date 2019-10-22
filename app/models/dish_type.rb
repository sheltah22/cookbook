class DishType < ApplicationRecord
  before_save { self.name = name.humanize(capitalize: true) }

  validates :name, presence: true,
            uniqueness: { case_sensitive: false }

  has_many :recipes
end
