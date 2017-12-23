require_relative 'vector'

class SpiralMemory
  attr_reader :current_square
  attr_writer :current_square

  def initialize
    @data = {}
  end

  def [](vector)
    if @data.has_key? vector
      @data[vector]
    else
      0
    end
  end

  def []=(vector,value)
    @data[vector] = value
  end

  def current_value=(value)
    self[current_square] = value
  end

  def self.build_spiral_to(target)
    spiral = SpiralMemory.new

    value = 1
    spiral.current_square = Vector.new(0,0)
    spiral.current_value = value
    direction = :east

    while (value < target)
      value += 1
      square = spiral.current_square.next(direction)
      spiral.current_square = square
      spiral.current_value = value
      case direction
      when :north
        if spiral[square.next(:west)] == 0
          direction = :west
        end
      when :east
        if spiral[square.next(:north)] == 0
          direction = :north
        end
      when :south
        if spiral[square.next(:east)] == 0
          direction = :east
        end
      when :west
        if spiral[square.next(:south)] == 0
          direction = :south
        end
      else
        raise "invalid direction #{direction}"
      end
    end

    spiral
  end
end
