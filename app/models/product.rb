class Product
  attr_reader :sku, :name, :customer_review_average, :description, :sale_price, :image
  def self.all(name)
    response = BestBuyService.new(name)
    products = response.get_products["products"]
    products.map do |product|
      Product.new(product)
    end
  end

  def initialize(product)
    @sku = product["sku"]
    @name = product["name"]
    @customer_review_average = product["customerReviewAverage"]
    @description = product["shortDescription"]
    @sale_price = product["salePrice"]
    @image = product["image"]
  end
end
