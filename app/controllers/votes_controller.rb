class VotesController < ApplicationController
  def create
    @vote = Vote.new(up: true)
    @review = Review.find(params[:review_id])
    @vote.review = @review
    @vote.user = current_user
    @brand = @review.brand
    if @vote.save
      redirect_to brand_path(@brand), notice: "+1 vote added to the review."
    elsif @vote.present?
      redirect_to brand_path(@brand), alert: "You have already voted."
    else
      redirect_to brand_path(@brand), alert: "Error: the vote has not been added."
    end
  end

  private

  def vote_params
    params.require(:review).permit(:up)
  end
end
