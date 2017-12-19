class Hex
  class HexPath
    def initialize(steps)
      @steps = steps
    end

    def simplify
      @steps
    end
  end

  def self.parse(path)
    HexPath.new(path.split(','))
  end
end
