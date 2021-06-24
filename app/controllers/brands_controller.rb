class BrandsController < ApplicationController
  def index
    if params[:category]
      @brands = Brand.joins(:categories).where(categories: { name: params[:category] })
    else
      @brands = Brand.all
    end

    @brands.each do |brand|
      brand.overall_score = (brand.environmental_score.to_f + brand.social_score.to_f + brand.quality_score.to_f) / 3
    end
  end

  def show
    @brand = Brand.find(params[:id])
    @brand.overall_score = (@brand.environmental_score.to_f + @brand.social_score.to_f + @brand.quality_score.to_f) / 3

    @toggle = current_user.favorites.select { |favorite| favorite.brand_id == @brand.id }

    @review = Review.new

    sum = 0
    @brand.reviews.each { |review| sum += review.score }
    @consumer_score = sum / @brand.reviews.size.to_f
  end
end
