require "test_helper"

class Public::DeliverysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_deliverys_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_deliverys_edit_url
    assert_response :success
  end
end
