class Firewall
  def initialize(rules)
    @picoseconds = 0
    number_of_layers = rules.keys.max+1
    rules.default = 0

    @layers = (0..number_of_layers-1).map{|depth| Layer.new(depth, rules[depth]) }
  end

  def advance
    @picoseconds += 1
    @layers.each do |layer|
      layer.advance
      layer.has_packet = false
    end
    if @packet_layer != nil
      @packet_layer += 1
      @layers[@packet_layer].has_packet = true
    end
  end

  def inject
    @packet_layer = 0
    @layers[0].has_packet = true
  end

  def packet_is_caught
    if @packet_layer == nil
      raise 'No packet injected'
    end

    @layers[@packet_layer].packet_is_caught
  end

  class Layer
    attr_accessor :depth, :range, :has_packet

    def initialize(depth, range)
      @depth = depth
      @range = range
      @scanner_position = 0
      @scanner_direction = :increase
      @has_packet = false
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

    def packet_is_caught
      has_packet and @scanner_position == 0
    end

    def make(r)
      if @range == 0 and r == 0
        if has_packet
          '(.)'
        else
          '...'
        end
      else
        if r >= @range
          '   '
        else
          if r == @scanner_position
            char = 'S'
          else
            char = ' '
          end
          if r == 0 and has_packet
            "(#{char})"
          else
            "[#{char}]"
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
