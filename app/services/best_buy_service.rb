class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("http://api.bestbuy.com/v1/products(longDescription=iPhone*)")
  end

  def get_products
    binding.pry
    JSON.parse(connection.get("?show=sku,name,customerReviewAverage,shortDescription,salePrice,image&pageSize=15&page=5&apiKey=r57cg7bzeza9xmw2ya3cp6ju&format=json").body)
  end
end
