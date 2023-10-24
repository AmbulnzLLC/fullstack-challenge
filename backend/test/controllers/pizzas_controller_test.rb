require "test_helper"

class PizzasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pizzas_index_url
    assert_response :success
  end
end
