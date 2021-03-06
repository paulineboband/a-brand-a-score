class BrandsController < ApplicationController
  skip_before_action :authenticate_user!, only: :scores
  def index

    if params[:query].present?
      @brands = Brand.search_by_name(params[:query]).order('name ASC')
    elsif params[:category]
      if params[:category] == 'All'
        @brands = Brand.all.order('name ASC')
      else
        @brands = Brand.joins(:categories).where(categories: { name: params[:category] }).order('name ASC')
      end

    else
      @brands = Brand.all.order('name ASC')
    end

    @brands.each do |brand|
      if brand.quality_score.nil?
        brand.overall_score = (brand.environmental_score.to_f + brand.social_score.to_f) / 2
      else
        brand.overall_score = (brand.environmental_score.to_f + brand.social_score.to_f + brand.quality_score.to_f) / 3
      end
    end

    @request = Request.new
    @categories = Category.all

    respond_to do |format|
      format.html {}
      format.json {
        render json: @brands.map { |brand| brand.to_hash }
      }
    end
  end

  def show
    @brand = Brand.find(params[:id])

    @toggle = current_user.favorites.select { |favorite| favorite.brand_id == @brand.id }

    @review = Review.new

    sum = 0
    @brand.reviews.each { |review| sum += review.score }
    @consumer_score = sum / @brand.reviews.size.to_f

    if @brand.quality_score.nil?
      @brand.overall_score = (@brand.environmental_score.to_f + @brand.social_score.to_f) / 2
    else
      @brand.overall_score = (@brand.environmental_score.to_f + @brand.social_score.to_f + @brand.quality_score.to_f) / 3
    end

    sorted = Brand.where('id != ?', @brand.id).where("overall_score >= 3")
    @random = sorted.sample(6)

    NewsController.create(@brand)
  end

  def scores
    array_params = params[:url].split(",").map {|word| word.capitalize}
    @brand = Brand.find_by('name IN (?)', array_params)
    respond_to do |format|
      format.html {}
      format.json {
        render json: @brand
      }
    end
  end
end
