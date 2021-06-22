# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'open-uri'
require 'nokogiri'

brand = 'nike'
url = "https://fr.igraal.com/codes-promo/#{brand}/code-promotionnel"

html_file = URI.open(url, "User-Agent" => "salut").read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('merchant-header__title title title--sec bold-text color-black').each do |element|
  puts element.text.strip
end
