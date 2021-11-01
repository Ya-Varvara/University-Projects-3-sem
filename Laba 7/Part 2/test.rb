require 'minitest/autorun'
require './main'

class TestClasses < Minitest::Unit::TestCase
  def test_circle
    assert_kind_of(Circle, Circle.new(10, 12, 4))
  end

  def test_ball_class_circle
    assert_kind_of(Circle, Ball.new(1, 2, 3, 5))
  end

  def test_ball_class_ball
    assert_kind_of(Ball, Ball.new(1, 2, 3, 5))
  end
end
