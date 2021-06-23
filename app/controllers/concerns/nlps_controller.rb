class NlpsController < ApplicationController

  def analyse
    @brand = Brand.find(params[:brand_id])
    @text = @brand.reviews.map { |review| review.content }.join(" ")

    @analyse = WatsonService.new(@text).analyse

    nlp = Nlp.new(
      brand_id: @brand.id,
      sentiment_score: @analyse["sentiment"]["document"]["score"],
      sentiment_label: @analyse["sentiment"]["document"]["label"],
      joy: @analyse["emotion"]["document"]["emotion"]["joy"],
      sadness: @analyse["emotion"]["document"]["emotion"]["sadness"],
      fear: @analyse["emotion"]["document"]["emotion"]["fear"],
      disgust: @analyse["emotion"]["document"]["emotion"]["disgust"],
      anger: @analyse["emotion"]["document"]["emotion"]["anger"]
    )
    nlp.save!
    redirect_to brand_path(@brand)
    #raise

  end
end
