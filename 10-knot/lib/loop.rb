class Loop
  attr_accessor :elements

  def initialize(loop_size)
    @elements = *(0..(loop_size-1))
    @current_position = 0
    @skip = 0
  end

  def reverse(length)
    index = @current_position
    @elements.rotate!(index)
    @elements = @elements[0, length].reverse + @elements[length..-1]
    @elements.rotate!(-index)
  end

  def hash(lengths)
    @current_position = 0
    lengths.each do |length|
      reverse(length)
      @current_position += length + @skip
      @current_position %= @elements.size
      @skip += 1
    end
  end
end
