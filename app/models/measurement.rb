class Measurement < ApplicationRecord
  belongs_to :variety
  has_many :ingredients

  before_save { self.name = name.downcase }

  validates :name, presence: true,
                   allow_blank: true,
                   uniqueness: { case_sensitive: false }
end
