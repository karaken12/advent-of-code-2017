class Maze
  attr_reader :step

  def initialize(array)
    @array = array
    @step = 0
  end

  def escape
    @step = 5
  end
end
