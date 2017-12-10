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
    ring = ring(square)
    square == ring_corners(ring)[3]
  end

  def SpiralMemory.ring(square)
    root = Math.sqrt(square)
    ring = ((root+1)/2).ceil
  end

  def SpiralMemory.ring_corners(ring)
    corners = [0,0,0,0]
    side = ring*2 - 1
    corners[3] = side**2
    corners[2] = corners[3] - (side-1)
    corners[1] = corners[2] - (side-1)
    corners[0] = corners[1] - (side-1)
    corners
  end

  def SpiralMemory.square_home_vector(ring)
      mv = ring - 1
      Vector.new(-mv,mv)
  end
end
