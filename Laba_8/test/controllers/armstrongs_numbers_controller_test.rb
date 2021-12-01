# frozen_string_literal: true

require_relative '../test_helper'

class ArmstrongsNumbersControllerTest < ActionController::TestCase
  test 'should get input' do
    get :input
    assert_response :success
  end

  test 'should get view' do
    get :view
    assert_response :success
  end

  test 'should get 4 numbers for view with 3' do
    expected = [[153, '1^3 + 5^3 + 3^3'], [370, '3^3 + 7^3 + 0^3'], [371, '3^3 + 7^3 + 1^3'], [407, '4^3 + 0^3 + 7^3']]
    get :view, params: { v1: 3 }
    assert_equal expected, assigns[:numbers]
  end

  test 'should get from view with empty' do
    expected = 'Пусто'
    get :view, params: { v1: '' }
    assert_equal expected, assigns[:result]
  end
end
