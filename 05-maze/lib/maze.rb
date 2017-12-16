class Maze
  attr_reader :step
  attr_writer :log

  def initialize(array)
    @array = array
    @step = 0
    @offset = 0
    @escaped = false
    @mode = 1
    @log = false
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
    puts
    show_state
    while !@escaped
      move
      @step += 1
      if @offset >= @array.length
        @escaped = true
      end
      show_state
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

  def show_state
    if @log
      puts "#{'%02d' % @step}: #{@array.map.with_index{|x,i| i==@offset ? "(#{x})" : " #{x} "}.join('')}"
    end
  end
end
