require 'csv'

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
            environmental_score: row[1].to_f,
            social_score: row[2].to_f,
          )
  brand.quality_score = row[3].to_f unless row[3].to_f == 0
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
  user_id: user.id
  )
review1.save!

