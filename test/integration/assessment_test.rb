require "test_helper"

class AssessmentTest <  ActionDispatch::IntegrationTest
  def setup
    Capybara.app = Storedom::Application
  end

  def test_it_searches_sennheiser
    visit '/'
    assert_equal 200, page.status_code

    fill_in "q", with: "sennheiser"
    click_on("Search")

    assert_equal current_path, search_path

    assert page.has_content?("Your search returned 10 products")
    assert page.has_content?("ID")
    assert page.has_content?("Name")
    assert page.has_content?("Description")
  end

  def test_it_searches_sennheiser_headphones_white
    skip
    visit '/'
    assert_equal 200, page.status_code

    fill_in "q", with: "sennheiser headphones white"
    click_on("Search")

    assert_equal current_path, search_path

    assert page.has_content?("Your search returned 15 products")
    within('.product-4434003') do
      assert page.has_content?("4434003")
      assert page.has_content?("Sennheiser")
      assert page.has_content?("Stainless steel")
      assert page.has_content?("5")
    end
  end
end
