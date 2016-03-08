require "test_helper"

class BestBuyServiceTest < ActiveSupport::TestCase
  test '#' do
    VCR.use_cassette('sennheiser') do
      current_service = BestBuyService.new("sennheiser")
      products = current_service.get_products["products"]

      refute products.nil?

      assert_equal products.first.count, 6
      assert_equal products.first["sku"], 4434003
      assert_equal products.first["name"], "Sennheiser - MOMENTUM Earbud Headphones - Black Chrome"
      assert_equal products.first["customerReviewAverage"], "5.0"
      assert_equal products.first["shortDescription"], "Stainless steel acoustic pipes; sound isolating; dynamic speaker system; 3-button in-line remote; in-line microphone; tangle-free cable; includes carrying case"
      assert_equal products.first["salePrice"], 99.98
      assert_equal products.first["image"], "http://images.bestbuy.com/BestBuy_US/images/products/4434/4434003_sa.jpg"

      assert_equal products.count, 15
    end
  end
end
