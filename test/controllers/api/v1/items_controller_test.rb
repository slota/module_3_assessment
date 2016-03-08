require "test_helper"

class Api::V1::ItemsControllerTest < ActionController::TestCase

  def setup
    @item1 = Item.create(name: "john", description: "kewl", image_url: "yeah right")
    @item2 = Item.create(name: "edgar", description: "sweet", image_url: "no way")
  end

  test "#index" do
    get :index, format: :json

    items = JSON.parse(response.body)["items"]
    assert_response(:success)

    assert_equal items.first["name"], "john"
    assert_equal items.first["description"], "kewl"
    assert_equal items.first["image_url"], "yeah right"

    assert_equal items.last["name"], "edgar"
    assert_equal items.last["description"], "sweet"
    assert_equal items.last["image_url"], "no way"
  end

  test "#show" do
    get :show, format: :json, id: @item2.id

    item = JSON.parse(response.body)["item"]
    assert_response(:success)

    assert_equal item["name"], "edgar"
    assert_equal item["description"], "sweet"
    assert_equal item["image_url"], "no way"
  end

  test "#delete" do
    get :destroy, format: :json, id: @item2.id

    assert_response(:success)
    assert_equal Item.count, 1
  end

  test "#create" do
    get :create, format: :json, name: "steve", description: "super kewl", image_url: "tight"

    item = JSON.parse(response.body)["item"]
    assert_response(:success)

    assert_equal item["name"], "steve"
    assert_equal item["description"], "super kewl"
    assert_equal item["image_url"], "tight"
  end

end
