class ConsumerScoreService
  def initialize(brand)
    @brand = brand
  end

  def compute
    sum = 0
    @brand.reviews.each { |review| sum += review.score }
    @consumer_score = sum / @brand.reviews.size.to_f
    @brand.consumer_score = @consumer_score
    @brand.save!
  end
end
