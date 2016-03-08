class BestBuyService
  attr_reader :connection

  def initialize(name)
    @connection = Faraday.new("http://api.bestbuy.com/v1/products(longDescription%20in(#{name}))")
  end

  def get_products
    JSON.parse(connection.get("?show=sku,name,customerReviewAverage,shortDescription,salePrice,image&apiKey=#{ENV["BEST_BUY_KEY"]}&format=json").body)
  end
end
