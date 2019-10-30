class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :dish_type
  has_many :ingredients, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  accepts_nested_attributes_for :ingredients, allow_destroy: true,
                                reject_if: lambda { |attributes| attributes['amount'].blank? }
end
