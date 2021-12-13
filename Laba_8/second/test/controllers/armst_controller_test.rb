require "test_helper"

class ArmstControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get armst_input_url
    assert_response :success
  end

  test "should get view" do
    get armst_view_url
    assert_response :success
  end
end
