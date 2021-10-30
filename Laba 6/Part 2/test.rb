# frozen_string_literal: true
require 'minitest/autorun'
require './main'

# Ruby Documentation
class TestSumOfRow < Minitest::Unit::TestCase
  def test_first
    assert_equal(0.91667, sum_of_row(0.001))
  end

  def test_second
    assert_equal(0.96296, sum_of_row(0.0001))
  end
end

