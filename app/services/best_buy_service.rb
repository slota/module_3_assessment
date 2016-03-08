class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("http://api.bestbuy.com/v1/products(longDescription=iPhone*)")
  end

  def get_products
    JSON.parse(connection.get("?show=sku,name,customerReviewAverage,shortDescription,salePrice,image&pageSize=15&page=5&apiKey=#{ENV["BEST_BUY_KEY"]}&format=json").body)
  end
end
