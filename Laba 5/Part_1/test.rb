# require 'faker'
require 'minitest/autorun'
require './main'

class TestCalculate < Minitest::Unit::TestCase

  def test_1
    x = 5.0
    z = rand(15) - 5
    assert_equal false, calculate(x, z)
  end

  def test_2
    x = 1.0
    z = 1.0
    assert_equal -0.339, calculate(x, z)
  end

  def test_3
    x = -1
    z = -1
    assert_equal 1.001, calculate(x, z)
  end

  def test_4
    x = 10.0
    z = 10
    assert_equal 0.953, calculate(x, z)
  end

end

