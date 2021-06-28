require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class NewsService
  def initialize(brand)
    @brand = brand
  end

  def parse
    url = URI("https://contextualwebsearch-websearch-v1.p.rapidapi.com/api/search/NewsSearchAPI?q=#{@brand.name}%20social%20responsibility&pageNumber=1&pageSize=3&autoCorrect=false&withThumbnails=true&fromPublishedDate=null&toPublishedDate=null")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = '758f2d1160msh4e49967e1930b6dp185414jsn468a85ac5326'
    request["x-rapidapi-host"] = 'contextualwebsearch-websearch-v1.p.rapidapi.com'

    response = http.request(request)

    JSON.parse(response.read_body)
  end
end
