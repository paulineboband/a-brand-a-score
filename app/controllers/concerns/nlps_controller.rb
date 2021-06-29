class NlpsController < ApplicationController

  def analyse
    @brand = Brand.find(params[:brand_id])
    @text = @brand.reviews.map { |review| "#{review.title} #{review.content}" }.join(" ")
    @analyse = WatsonService.new(@text).analyse
    @review_tab = true

    if @brand.nlp.nil?
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
     # redirect_to brand_path(@brand)
      redirect_to controller: 'brands', action: 'show', id: @brand.id, review_tab: 'true'
    else
      @brand.nlp.sentiment_score = @analyse["sentiment"]["document"]["score"]
      @brand.nlp.sentiment_label = @analyse["sentiment"]["document"]["label"]
      @brand.nlp.joy = @analyse["emotion"]["document"]["emotion"]["joy"]
      @brand.nlp.sadness = @analyse["emotion"]["document"]["emotion"]["sadness"]
      @brand.nlp.fear = @analyse["emotion"]["document"]["emotion"]["fear"]
      @brand.nlp.disgust = @analyse["emotion"]["document"]["emotion"]["disgust"]
      @brand.nlp.anger = @analyse["emotion"]["document"]["emotion"]["anger"]
      @brand.nlp.save!
      # redirect_to brand_path(@brand)
      redirect_to controller: 'brands', action: 'show', id: @brand.id, review_tab: 'true'
    end
  end
end
