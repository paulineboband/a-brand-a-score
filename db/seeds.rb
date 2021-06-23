require 'csv'
require 'open-uri'
require 'nokogiri'

Category.destroy_all
Tag.destroy_all
BrandCategory.destroy_all
Review.destroy_all
Brand.destroy_all

user = User.find_by(email: "timothee.rouquette@gmail.com")

#Seeding categories
clothing = Category.new(name: "clothing")
clothing.save!
shoes = Category.new(name: "shoes")
shoes.save!
sportswear = Category.new(name: "sportswear")
sportswear.save!
accessories = Category.new(name: "accessories")
accessories.save!
underwear = Category.new(name: "underwear")
underwear.save!

#Seeding tags
environmental = Tag.new(name: "environmental")
environmental.save!
social = Tag.new(name: "social")
social.save!
quality = Tag.new(name: "quality")
quality.save!

#Seeding brands and brand categories
CSV.foreach(("db/brand_scores.csv"), headers: true, col_sep: ";") do |row|
  brand = Brand.new(name: row[0],
            environmental_score: row[1].gsub(",", ".").to_f,
            social_score: row[2].gsub(",", ".").to_f,
            website_url: "www.#{row[0].gsub(/\s+/, "").gsub(/\.+/, "").gsub(/\&+/, "").downcase}.com"
          )
  brand.quality_score = row[3].gsub(",", ".").to_f unless row[3].nil?
  brand.save!
  array = row[4].split("/")
  array.each do |category|
    BrandCategory.new(brand_id: brand.id,
      category_id: Category.find_by(name: category).id
    )
  end
end


#Seeding reviews
review1 = Review.new(title: "Very satisfied",
  content: "I really like this brand",
  score: 4,
  brand_id: Brand.find_by(name: "Dr. Martens").id,
  user_id: 1
  )
review1.save!

#Seeding reviews by scraping

#Brand.all.each do |brand|
  #p brand.website_url
  #if URI.open("https://www.trustpilot.com/review/#{brand.website_url}")
    #html_content = URI.open("https://www.trustpilot.com/review/#{brand.website_url}").read
  #end
#end

#Dr. Martens
html_content = URI.open("https://www.trustpilot.com/review/www.drmartens.com").read
doc = Nokogiri::HTML(html_content)

doc.search('.review-content').each do |element|
  title = element.search('.review-content__title').first.text.strip
  content = element.search('.review-content__text').first.text.strip
  rating_element = element.search(".star-rating img").first.attribute("alt")
  rating = rating_element ? rating_element.text.strip.match(/\d\.?\d*/)[0] : nil
  review = Review.new(title: title ,
    score: rating,
    brand_id: Brand.find_by(name: "Dr. Martens").id,
    user_id: user.id,
    content: content
  )
  review.save!
end

#Nike
html_content = URI.open("https://www.trustpilot.com/review/www.nike.com").read
doc = Nokogiri::HTML(html_content)

doc.search('.review-content').each do |element|
  title = element.search('.review-content__title').first.text.strip
  content = element.search('.review-content__text').first.text.strip
  rating_element = element.search(".star-rating img").first.attribute("alt")
  rating = rating_element ? rating_element.text.strip.match(/\d\.?\d*/)[0] : nil
  review = Review.new(title: title ,
    score: rating,
    brand_id: Brand.find_by(name: "Nike").id,
    user_id: user.id,
    content: content
  )
  review.save!
end

#Adidas
html_content = URI.open("https://www.trustpilot.com/review/www.adidas.com").read
doc = Nokogiri::HTML(html_content)

doc.search('.review-content').each do |element|
  title = element.search('.review-content__title').first.text.strip
  content = element.search('.review-content__text').first.text.strip
  rating_element = element.search(".star-rating img").first.attribute("alt")
  rating = rating_element ? rating_element.text.strip.match(/\d\.?\d*/)[0] : nil
  review = Review.new(title: title ,
    score: rating,
    brand_id: Brand.find_by(name: "Adidas").id,
    user_id: user.id,
    content: content
  )
  review.save!
end


























