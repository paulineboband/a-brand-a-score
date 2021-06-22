class Review < ApplicationRecord
  belongs_to :user
  belongs_to :brand

  has_many :tag_reviews
  has_many :votes
end
