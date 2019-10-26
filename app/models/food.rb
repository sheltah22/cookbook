class Food < ApplicationRecord
  has_and_belongs_to_many :varieties
  has_many :ingredients, dependent: :destroy

  before_save { self.name = name.downcase }

  validates :name, presence: true,
            uniqueness: { case_sensitive: false }
  validates :varieties, presence: true
end
