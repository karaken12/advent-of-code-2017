require_relative 'vector'

class SpiralMemory
  attr_reader :current_square
  attr_writer :current_square

  def initialize
    @data = {}
  end

  def [](x,y)
    vector = Vector.new(x,y)
    if @data.has_key? vector
      @data[Vector.new(x,y)]
    else
      0
    end
  end

  def []=(x,y,value)
    @data[Vector.new(x,y)] = value
  end

  def self.build_spiral_to(target)
    spiral = SpiralMemory.new

    value = 1
    x = 0
    y = 0
    spiral.current_square = Vector.new(x,y)
    spiral[x,y] = value
    direction = :east

    while (value < target)
      value += 1
      case direction
      when :north
        y += 1
        if spiral[x-1,y] == 0
          direction = :west
        end
      when :east
        x += 1
        if spiral[x,y+1] == 0
          direction = :north
        end
      when :south
        y -= 1
        if spiral[x+1,y] == 0
          direction = :east
        end
      when :west
        x -= 1
        if spiral[x,y-1] == 0
          direction = :south
        end
      else
        raise "invalid direction #{direction}"
      end
      spiral.current_square = Vector.new(x,y)
      spiral[x,y] = value
    end

    spiral
  end
end
