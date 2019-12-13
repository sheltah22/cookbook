class Recipe < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  belongs_to :dish_type
  has_many :ingredients, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  accepts_nested_attributes_for :ingredients, allow_destroy: true,
                                reject_if: lambda { |attributes| attributes['amount'].blank? }

  pg_search_scope :search_by_title,
                  against: :title,
                  using: {
                    tsearch: {
                      prefix: true,
                      any_word: true
                    }
                  }

  scope :by_dish_type, -> (dish_type_id) {
      where(dish_type: dish_type_id) if dish_type_id.present?
  }

  def self.search(query)
    if query.present?
      search_by_title(query)
    else
      order(name: :asc)
    end
  end
end
