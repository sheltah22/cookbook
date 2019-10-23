class Measurement < ApplicationRecord
  belongs_to :variety
  has_many :ingredients, dependent: :destroy

  before_save { self.name = name.downcase }

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
end
