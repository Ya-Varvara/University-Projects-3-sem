require 'minitest/autorun'
require './main_3'

# Ruby Documentation
class TestIntprg < Minitest::Unit::TestCase
  def test_first_func_block
    assert_equal(0.6666, intprg(0, 2) { |x| x * (x - 1) })
  end

  def test_first_func_lambda
    assert_equal(0.6666, intprg(0, 2, &->(x) { x * (x - 1) }))
  end

  def test_second_func_block
    assert_equal(1.12538, intprg(0, 1) { |x| Math.exp(x) / (x + 1) })
  end

  def test_second_func_lambda
    assert_equal(1.12538, intprg(0, 1, &->(x) { Math.exp(x) / (x + 1) }))
  end
end
