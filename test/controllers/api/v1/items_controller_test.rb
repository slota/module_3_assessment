require "test_helper"

class Api::V1::ItemsControllerTest < ActionController::TestCase

  def setup
    @item1 = Item.create(name: "john", description: "kewl", image_url: "yeah right")
    @item2 = Item.create(name: "edgar", description: "sweet", image_url: "no way")
  end
  test "#index" do
    get :index, format: :json
    items = JSON.parse(response.body)["items"]
  end
end
