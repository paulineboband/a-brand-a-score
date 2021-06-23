class BrandsController < ApplicationController
  def index
    @brands = Brand.all
    @brands.each do |brand|
      brand.overall_score = (brand.environmental_score.to_f + brand.social_score.to_f + brand.quality_score.to_f) / 3
    end
  end

  def show
    @brand = Brand.find(params[:id])
    @brand.overall_score = (@brand.environmental_score.to_f + @brand.social_score.to_f + @brand.quality_score.to_f) / 3


    @toggle = current_user.favorites.select { |favorite| favorite.brand_id == @brand.id }

    @review = Review.new
  end
end
