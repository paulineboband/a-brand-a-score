require 'open-uri'

url = 'https://newsapi.org/v2/everything?'\
      'q=louis-vuitton&'\
      'from=2021-06-23&'\
      'sortBy=popularity&'\
      "apiKey=01455dce476a4f88ac19a3aedf97bdf4"

req = open(url)

response_body = req.read

puts response_body



