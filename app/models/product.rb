class Product
  attr_reader :sku, :name, :customer_review_average, :description, :sale_price, :image
  def self.all(name)
    name_params = name_ready(name)
    response = BestBuyService.new(name_params)
    products = response.get_products["products"]
    products.map do |product|
      Product.new(product)
    end
  end

  def self.name_ready(name)
    name.split.map do |v|
      v + "*" + ","
    end.join(" ")
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
