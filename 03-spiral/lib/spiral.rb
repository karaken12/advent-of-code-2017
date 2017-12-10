require_relative 'vector'

class SpiralMemory
  def SpiralMemory.home_vector(square)
    ring = ring(square)
    if ring_corners(ring).include? square
      corner_home_vector(ring, ring_corners(ring).index(square))
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

end
