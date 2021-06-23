class BrandsController < ApplicationController
  def index
    @brands = Brand.all

    if params[:category]
      @brands = Brand.where(:categories => params[:category])
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
