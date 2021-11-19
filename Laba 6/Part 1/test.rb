require 'minitest/autorun'
require './main'

class TestSumOfRow < Minitest::Test
  def test_first
    assert_equal(1, sum_of_row(0.001).round)
  end

  def test_second
    assert_equal(1, sum_of_row(0.0001).round)
  end
end
