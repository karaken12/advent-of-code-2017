class Tubes
  Position = Struct.new(:path, :x, :y) do
    def is_letter
      value =~ /[[:alpha:]]/
    end

    def letter
      value
    end

    def value
      if y < 0 or y >= path.size or x < 0 or x >= path[y].length
        ' '
      else
        path[y][x]
      end
    end

    def to_s
      "(#{x},#{y}): '#{value}'"
    end
  end

  def initialize(path)
    @path = path.lines
  end

  def follow
    letters = ''
    pos = find_start_position
    dir = :down
    while true
      next_position, next_direction = find_next_position(pos, dir)
      if !next_position
        break
      end
      pos = next_position
      dir = next_direction
      if pos.is_letter
        letters += pos.letter
      end
    end
    letters
  end

  def find_start_position
    x = 0
    pos = Position.new(@path, x, 0)
    while pos.value != '|'
      x += 1
      pos = Position.new(@path, x, 0)
    end
    pos
  end

  def find_next_position(position, direction)
    value = position.value
    if value == '+'
      possibles = {
        down: Position.new(@path, position.x, position.y+1),
        up: Position.new(@path, position.x, position.y-1),
        left: Position.new(@path, position.x-1, position.y),
        right: Position.new(@path, position.x+1, position.y),
			}
      case direction
      when :down
        opposite_direction = :up
      when :up
        opposite_direction = :down
      when :left
        opposite_direction = :right
      when :right
        opposite_direction = :left
      else
        raise "Unknown direction #{direction}"
      end
      possibles.delete(opposite_direction)
			possibles = possibles.select{|dir,pos| pos.value != ' '}
      if possibles.size > 1
        raise "Multiple possibles for #{position} #{direction}! #{possibles}"
      end
      if possibles.size > 0
        next_direction = possibles.keys.first
        next_position = possibles[next_direction]
      else
        raise 'end of path'
        next_position = nil
        next_direction = nil
      end
    else
      case direction
      when :down
        next_position = Position.new(@path, position.x, position.y+1)
      when :up
        next_position = Position.new(@path, position.x, position.y-1)
      when :left
        next_position = Position.new(@path, position.x-1, position.y)
      when :right
        next_position = Position.new(@path, position.x+1, position.y)
      else
        raise "Unknown direction #{direction}"
      end
      if next_position.value == ' '
        next_position = nil
      end
      next_direction = direction
    end
    [next_position, next_direction]
  end
end
