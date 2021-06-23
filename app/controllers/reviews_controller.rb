class ReviewsController < ApplicationController
  def new
    @brand = Brand.find(params[:brand_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @brand = Brand.find(params[:brand_id])
    @review.brand = @brand
    @review.save
    redirect_to brand_path(@brand)
  end

  private

  def review_params
    params.require(:review).permit(:content, :title, :score)
  end
end
