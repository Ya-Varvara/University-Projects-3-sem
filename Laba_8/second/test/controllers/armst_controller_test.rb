require_relative '../test_helper'

# class ArmstControllerTest < ActionDispatch::IntegrationTest
class ArmstControllerTest < ActionController::TestCase
  test 'should get input' do
    get :input
    assert_response :success
  end

  test 'should get view' do
    get :view
    assert_response :success
  end

  test 'should get HTML content type' do
    get :view, params: { v1: '', side: 'server' }
    assert_equal('text/html', @response.content_type.split(';')[0], 'Received another format')
  end

  test 'should get XML content type' do
    get :view, params: { v1: '', side: 'client' }
    assert_equal('application/xml', @response.content_type.split(';')[0], 'Received another format')
  end

  test 'should get XML type with XSLT' do
    get :view, params: { v1: '', side: 'client-with-xslt' }
    assert_equal('application/xml', @response.content_type.split(';')[0], 'Received another format')
  end
end
