class Firewall
  def initialize(rules)
    @picoseconds = 0
    number_of_layers = rules.keys.max+1
    rules.default = 0

    @layers = (0..number_of_layers-1).map{|depth| Layer.new(depth, rules[depth]) }
  end

  def advance
    @picoseconds += 1
    @layers.each{|layer| layer.advance}
  end

  class Layer
    attr_accessor :depth, :range

    def initialize(depth, range)
      @depth = depth
      @range = range
      @scanner_position = 0
      @scanner_direction = :increase
    end

    def advance
      if @scanner_direction == :increase
        @scanner_position += 1
        if @scanner_position == @range-1
          @scanner_direction = :decrease
        end
      elsif @scanner_direction == :decrease
        @scanner_position -= 1
        if @scanner_position == 0
          @scanner_direction = :increase
        end
      else
        raise 'Invalid direction'
      end
    end

    def make(r)
      if @range == 0
        if r == 0
          '...'
        else
          '   '
        end
      else
        if r >= @range
          '   '
        else
          if r == @scanner_position
            '[S]'
          else
            '[ ]'
          end
        end
      end
    end
  end

  def to_s
    layers_n = 0..@layers.size-1
    max_range = @layers.map{|l| l.range}.max - 1
    headers = [
      "Picosecond #{@picoseconds}:",
      layers_n.map{|depth| "#{depth}".center(3, ' ') }.join(' '),
    ]
    lines = (0..max_range).map do |r|
      layers_n.map{|depth| @layers[depth].make(r) }.join(' ')
    end
    (headers + lines).join("\n")
  end
end
