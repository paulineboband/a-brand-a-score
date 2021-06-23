class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find(params[:id])

    @toggle = current_user.favorites.select { |favorite| favorite.brand_id == @brand.id }
  end
end
