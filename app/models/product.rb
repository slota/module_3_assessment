class Product
  def self.all
    response = BestBuyService.new
    products = response.get_products["products"]
    products.map do |product|
      Product.new(product)
    end
  end

  def initialize(product)
    @sku = product["sku"]
    @name = product["name"]
    binding.pry
  end
end
