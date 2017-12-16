class Maze
  attr_reader :step

  def initialize(array)
    @array = array
    @step = 0
    @offset = 0
    @escaped = false
    @mode = 1
  end

  def mode=(mode)
    if mode == 1
      @mode = 1
    elsif mode == 2
      @mode = 2
    else
      throw "Invalid mode #{mode}."
    end
  end

  def escape
    while !@escaped
      move
      @step += 1
      if @offset >= @array.length
        @escaped = true
      end
    end
  end

  def move
    pos = @offset
    @offset += @array[pos]
    if @mode == 1
      @array[pos] += 1
    else
      if @array[pos] >= 3
        @array[pos] -= 1
      else
        @array[pos] += 1
      end
    end
  end
end
