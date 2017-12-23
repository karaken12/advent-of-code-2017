Vector = Struct.new(:x, :y) do
  def length
    x.abs + y.abs
  end

  def to_s
    "(#{x},#{y})"
  end
end
