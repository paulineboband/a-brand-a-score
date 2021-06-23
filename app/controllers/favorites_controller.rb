class FavoritesController < ApplicationController
  def display
    array_favorites = []
    @favorites = current_user.favorites
    @favorites_current_user = array_favorites.sort_by(&:created_at).reverse
  end

  def create
    @favorite = Favorite.new
    @brand = Brand.find(params[:brand_id])

    @favorite.brand = @brand
    @favorite.user = current_user
    redirect_to brand_path(@brand), notice: "Added to your favorite brands !" if @favorite.save!
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    redirect_to my_favorites_path
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :brand_id)
  end
end
