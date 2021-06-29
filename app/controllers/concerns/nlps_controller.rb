class NlpsController < ApplicationController

  def analyse
    @brand = Brand.find(params[:brand_id])
    @text = @brand.reviews.map { |review| "#{review.title} #{review.content}" }.join(" ")
    @analyse = WatsonService.new(@text).analyse

    if @brand.nlps.length != 0
      @brand.nlps.each do |nlp|
        nlp.destroy
      end
    end

    nlp = Nlp.new(
      brand_id: @brand.id,
      keyword: "document",
      sentiment_score: @analyse["sentiment"]["document"]["score"],
      sentiment_label: @analyse["sentiment"]["document"]["label"],
      joy: @analyse["emotion"]["document"]["emotion"]["joy"],
      sadness: @analyse["emotion"]["document"]["emotion"]["sadness"],
      fear: @analyse["emotion"]["document"]["emotion"]["fear"],
      disgust: @analyse["emotion"]["document"]["emotion"]["disgust"],
      anger: @analyse["emotion"]["document"]["emotion"]["anger"]
    )
    nlp.save!

    @analyse["keywords"].each do |keyword|
      nlp = Nlp.new(
        brand_id: @brand.id,
        keyword: keyword["text"],
        sentiment_score: keyword["sentiment"]["score"],
        sentiment_label: keyword["sentiment"]["label"],
        joy: keyword["emotion"]["joy"],
        sadness: keyword["emotion"]["sadness"],
        fear: keyword["emotion"]["fear"],
        disgust: keyword["emotion"]["disgust"],
        anger: keyword["emotion"]["anger"]
        )
      nlp.save!
    end

    redirect_to brand_path(@brand)
  end
end
