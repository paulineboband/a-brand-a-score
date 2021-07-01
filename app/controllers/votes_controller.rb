class VotesController < ApplicationController
  def create
    @vote = Vote.new(up: true)
    @review = Review.find(params[:review_id])
    @vote.review = @review
    @vote.user = current_user
    @brand = @review.brand
    if @vote.save
      flash[:notice] = "+1 vote added to the review."
      # redirect_to controller: 'brands', action: 'show', id: @brand.id, review_tab: 'true'
      redirect_to brand_path(@brand)
    elsif @vote.present?
      flash[:alert] = "You have already voted."
      #redirect_to controller: 'brands', action: 'show', id: @brand.id, review_tab: 'true'
      redirect_to brand_path(@brand)
    else
      flash[:alert] = "Error: the vote has not been added."
      # redirect_to controller: 'brands', action: 'show', id: @brand.id, review_tab: 'true'
      redirect_to brand_path(@brand)
    end
  end

  private

  def vote_params
    params.require(:review).permit(:up)
  end
end
