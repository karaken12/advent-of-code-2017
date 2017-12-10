require_relative 'vector'

class SpiralMemory
  def SpiralMemory.home_vector(square)
    ring = ring(square)
    next_corner = next_corner(square)
    corner_home_vector = corner_home_vector(ring, ring_corners(ring).index(next_corner))
    square_corner_vector = square_corner_vector(square, next_corner)
    home_vector = Vector.new(corner_home_vector.x + square_corner_vector.x, corner_home_vector.y + square_corner_vector.y)
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

  def SpiralMemory.corner_home_vector(ring, corner)
    mv = ring - 1
    case corner
    when 0
      Vector.new(-mv,-mv)
    when 1
      Vector.new(mv,-mv)
    when 2
      Vector.new(mv,mv)
    when 3
      Vector.new(-mv,mv)
    else
      raise "Unknown corner #{corner}"
    end
  end

  def SpiralMemory.square_home_vector(ring)
      mv = ring - 1
      Vector.new(-mv,mv)
  end

  def SpiralMemory.next_corner(square)
    ring = ring(square)
    corners = ring_corners(ring)
    if square <= corners[0]
      corners[0]
    elsif square <= corners[1]
      corners[1]
    elsif square <= corners[2]
      corners[2]
    elsif square <= corners[3]
      corners[3]
    else
      raise "Square #{sqaure} does not fit in ring #{ring} with corners #{corners}!"
    end
  end

  def SpiralMemory.square_corner_vector(square, corner_square)
    Vector.new(0,0)
    mv = corner_square - square
    corner = ring_corners(ring(square)).index(corner_square)
    case corner
    when 0
      Vector.new(0,mv)
    when 1
      Vector.new(-mv,0)
    when 2
      Vector.new(0,-mv)
    when 3
      Vector.new(mv,0)
    else
      raise "Unknwon corner #{corner} (#{corner_square})"
    end
  end

end
