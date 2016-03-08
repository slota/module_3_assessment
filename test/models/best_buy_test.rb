require 'test_helper'

class BestBuyTest < ActiveSupport::TestCase
  test 'model' do
    VCR.use_cassette('sennheiser-model') do
      products = Product.all("sennheiser")
      refute products.nil?

      assert_equal products.count, 10

      assert_equal products.first.sku, 9678429
      assert_equal products.first.name, "Sennheiser - Camera-Mount Wireless Microphone System - Black"
      assert_equal products.first.customer_review_average, nil
      assert_equal products.first.description, "SENNHEISER Camera-Mount Wireless Microphone System: Invisible clip-on microphone; sturdy metal housing; automatic frequency management; easy-to-read illuminated display; 4-level battery indicator; 626-668MHz frequency range"
      assert_equal products.first.sale_price, 629.95
      assert_equal products.first.image, "http://images.bestbuy.com/BestBuy_US/images/products/9678/9678429_sa.jpg"
    end
  end
end
