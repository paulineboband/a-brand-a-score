class BrandsController < ApplicationController
  def index
    if params[:category]
      @brands = Brand.joins(:categories).where(categories: { name: params[:category] })
    else
      @brands = Brand.all
    end
  end

  def show
    @brand = Brand.find(params[:id])

    @toggle = current_user.favorites.select { |favorite| favorite.brand_id == @brand.id }

    @review = Review.new


  end
end
