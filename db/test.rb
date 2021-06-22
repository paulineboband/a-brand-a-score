require 'csv'


clothing = Category.new(name: "Clothing")
clothing.save!
shoes = Category.new(name: "Shoes")
shoes.save!
sportswear = Category.new(name: "Sportswear")
sportswear.save!
accessories = Category.new(name: "Accessories")
accessories.save!
underwear = Category.new(name: "Underwear")
underwear.save!

Category.find_by(name: "Accessories")
