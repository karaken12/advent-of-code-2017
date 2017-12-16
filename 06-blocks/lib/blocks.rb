class Blocks
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def next_block
    @array.index(@array.max)
  end

  def redistribute
    block = next_block
    value = @array[block]
    @array[block] = 0
    while value > 0 do
      block += 1
      block %= @array.size
      @array[block] += 1
      value -= 1
    end
  end
end
