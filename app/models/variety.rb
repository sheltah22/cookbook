class Variety < ApplicationRecord
  has_many :measurements, dependent: :destroy
  has_many :foods, dependent: :destroy

  before_save { self.name = name.humanize(capitalize: true) }

  validates :name, presence: true,
            uniqueness: { case_sensitive: false }
end
