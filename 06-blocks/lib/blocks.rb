class Blocks
  attr_reader :array, :step, :cycle_length

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

  def detect_cycle
    @step = 0
    state_is_new = true
    states = []
    while state_is_new
      states << Array.new(@array)
      redistribute
      @step += 1
      if states.include? @array
        state_is_new = false
      end
    end
    @cycle_length = @step - states.index(@array)
  end
end
