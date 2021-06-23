class Brand < ApplicationRecord
  has_many :favorites
  has_many :reviews
  has_many :brand_categories
  has_many :categories, through: :brand_categories
  has_one :nlp
end
