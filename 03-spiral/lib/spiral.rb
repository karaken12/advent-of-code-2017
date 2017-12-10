require_relative 'vector'

class SpiralMemory
  def SpiralMemory.home_vector(square)
    if square_is_last_corner(square)
      square_home_vector(ring(square))
    else
      raise "cannot calculate for square #{square}"
    end
  end

  def SpiralMemory.square_is_last_corner(square)
    root = Math.sqrt(square)
    root == root.to_i and root % 2 == 1
  end

  def SpiralMemory.ring(square)
    root = Math.sqrt(square)
    ring = ((root+1)/2).ceil
  end

  def SpiralMemory.square_home_vector(ring)
      mv = ring - 1
      Vector.new(-mv,mv)
  end
end
