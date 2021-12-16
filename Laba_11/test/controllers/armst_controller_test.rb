require './test/test_helper.rb'

class ArmstControllerTest < ActionDispatch::IntegrationTest
  # test 'should get input' do
  #   get root_url
  #   assert_response :success
  # end

  # test 'test_return_json' do
  #   get armst_view_url, params: { v1: 3, format: 'json' }
  #   assert_response :success
  #   assert_includes @response.headers['Content-Type'], 'application/json'
  # end

  test 'test_record_in_db' do
    before = Armst.count
    get "http://localhost:3000/armst/view", params: { v1: 3 }
    after = Armst.count

    assert_equal before + 1, after
  end

end
