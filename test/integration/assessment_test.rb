require "test_helper"

class AssessmentTest <  ActionDispatch::IntegrationTest
  def setup
    Capybara.app = Storedom::Application
  end

  def test_it_reaches_the_root_page
    visit '/'
    assert_equal 200, page.status_code

    fill_in "search", with: "sennheiser"
    click_on("submit")

    current_path.should == '/search'
    assert page.has_content?("sku")
    assert page.has_content?("name")
    assert page.has_content?("customer average review")
    assert page.has_content?("description")
    assert page.has_content?("sale price")
    assert page.has_content?("image")
  end
end
