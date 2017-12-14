class Maze
  attr_reader :step

  def initialize(array)
    @array = array
    @step = 0
    @offset = 0
    @escaped = false
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
    @array[pos] += 1
  end
end
