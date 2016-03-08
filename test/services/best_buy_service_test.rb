require "test_helper"

class BestBuyServiceTest < ActiveSupport::TestCase
  test '#' do
    VCR.use_cassette('sennheiser') do
      current_service = BestBuyService.new("sennheiser*")
      products = current_service.get_products["products"]

      refute products.nil?

      assert_equal products.first.count, 6
      assert_equal products.first["sku"], 9678429
      assert_equal products.first["name"], "Sennheiser - Camera-Mount Wireless Microphone System - Black"
      assert_equal products.first["customerReviewAverage"], nil
      assert_equal products.first["shortDescription"], "SENNHEISER Camera-Mount Wireless Microphone System: Invisible clip-on microphone; sturdy metal housing; automatic frequency management; easy-to-read illuminated display; 4-level battery indicator; 626-668MHz frequency range"
      assert_equal products.first["salePrice"], 629.95
      assert_equal products.first["image"], "http://images.bestbuy.com/BestBuy_US/images/products/9678/9678429_sa.jpg"

      assert_equal products.count, 15
    end
  end
end
