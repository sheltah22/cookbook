class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :dish_type
  has_many :ingredients, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
