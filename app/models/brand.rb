class Brand < ApplicationRecord
  has_many :favorites
  has_many :reviews
  has_many :brand_categories
  has_many :categories, through: :brand_categories
  has_one :nlp

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
