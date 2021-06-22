class Brand < ApplicationRecord
  has_many :favorites
  has_many :reviews
  has_many :brand_categories

end
