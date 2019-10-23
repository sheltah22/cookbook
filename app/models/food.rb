class Food < ApplicationRecord
  belongs_to :variety
  has_many :ingredients

  before_save { self.name = name.downcase }

  validates :name, presence: true,
            uniqueness: { case_sensitive: false }
end
