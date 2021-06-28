class NewsController < ApplicationController
  def self.create(brand)
    News.destroy_all
    @brand = brand
    @latest_news = NewsService.new(@brand).parse["value"]

    @latest_news.each do |element|
      news = News.new( brand_id: @brand.id,
        title: element["title"],
        url: element["url"],
        description: element["description"],
        date: element["datePublished"],
        image_url: element["image"]["url"]
        )
      news.save!
    end
  end
end
