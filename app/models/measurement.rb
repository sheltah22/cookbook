class Measurement < ApplicationRecord
  has_many :ingredients

  before_save { self.name = name.downcase }

  validates :name, presence: true,
            uniqueness: { case_sensitive: false }
end
