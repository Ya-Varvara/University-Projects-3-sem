class Circle
  def initialize(x, y, r)
    @x_center = x
    @y_center = y
    @radius = r
  end

  attr_reader :x_center, :y_center, :radius

  def square
    (2 * 3.14 * radius**2).round
  end
end

class Ball < Circle
  def initialize(x, y, z, r)
    super(x, y, r)
    @z_center = z
  end

  attr_reader :z_center

  def volume
    (4 * 3.14 * radius**3 / 3).round
  end

  private def a
    puts 1
  end
end
