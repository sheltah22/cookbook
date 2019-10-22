class DishType < ApplicationRecord
  before_save { self.name = name.downcase }

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
end
