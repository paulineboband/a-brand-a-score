class BrandsController < ApplicationController
  def index
    if params[:category]
      @brands = Brand.joins(:categories).where(categories: { name: params[:category] })
    else
      @brands = Brand.all
    end

    @brands.each do |brand|
      if brand.quality_score.nil?
        brand.overall_score = (brand.environmental_score.to_f + brand.social_score.to_f) / 2
      else
        brand.overall_score = (brand.environmental_score.to_f + brand.social_score.to_f + brand.quality_score.to_f) / 3
      end
    end
  end

  def show
    @brand = Brand.find(params[:id])

    if @brand.quality_score.nil?
      @brand.overall_score = (@brand.environmental_score.to_f + @brand.social_score.to_f) / 2
    else
      @brand.overall_score = (@brand.environmental_score.to_f + @brand.social_score.to_f + @brand.quality_score.to_f) / 3
    end

    @toggle = current_user.favorites.select { |favorite| favorite.brand_id == @brand.id }

    @review = Review.new
  end
end
