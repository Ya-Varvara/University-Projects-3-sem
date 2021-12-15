require 'test_helper'

class ArmstControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get root_url
    assert_response :success
  end

  # test 'test_return_json' do
  #   get armst_view_url, params: { v1: 3, format: 'json' }
  #   assert_response :success
  #   assert_includes @response.headers['Content-Type'], 'application/json'
  # end

  test 'test_record_in_db' do
    before = Armst.count
    get armst_view_url, params: { v1: 333 }
    after = Result.count

    assert_equal before + 1, after
  end

end
