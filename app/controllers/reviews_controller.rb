class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @brand = Brand.find(params[:brand_id])
    @review.brand = @brand
    @review.user = current_user

    if @review.save
      ConsumerScoreService.new(@brand).compute
      redirect_to brand_brand_analyse_path(@brand)
    else
      # redirect_to brand_path(@brand), notice: "Error: the review did not save"
      # render_to_string(partial: "/shared/modalreview", locals: { brand: @brand, review: @review })
      @display_modal = true
      render "brands/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :title, :score)
  end
end
