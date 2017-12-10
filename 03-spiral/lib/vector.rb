class Vector
  attr_reader :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  def length
    x.abs + y.abs
  end
end
