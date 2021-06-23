class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @brand = Brand.find(params[:brand_id])
    @review.brand = @brand
    @review.user = current_user

    if @review.save
      redirect_to brand_path(@brand)
    else
      redirect_to brand_path(@brand), notice: "Error: the review did not save"
      #render_to_string(partial: "/shared/modalreview", locals: { brand: @brand, review: @review })
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :title, :score)
  end
end
