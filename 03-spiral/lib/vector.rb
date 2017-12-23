Vector = Struct.new(:x, :y) do
  def length
    x.abs + y.abs
  end

  def to_s
    "(#{x},#{y})"
  end

  def next(direction)
    case direction
    when :north
      Vector.new(x, y + 1)
    when :northeast
      Vector.new(x + 1, y + 1)
    when :east
      Vector.new(x + 1, y)
    when :southeast
      Vector.new(x + 1, y - 1)
    when :south
      Vector.new(x, y - 1)
    when :southwest
      Vector.new(x - 1, y - 1)
    when :west
      Vector.new(x - 1, y)
    when :northwest
      Vector.new(x - 1, y + 1)
    else
      raise "invalid direction #{direction}"
    end
  end
end
