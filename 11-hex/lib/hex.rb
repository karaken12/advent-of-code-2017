class Hex
  class HexPath
    def initialize(steps)
      @steps = steps
    end

    def simplify
      steps = {}
      steps[:ne] = @steps.count('ne')
      steps[:se] = @steps.count('se')
      steps[:s ] = @steps.count('s')
      steps[:sw] = @steps.count('sw')
      steps[:nw] = @steps.count('nw')
      steps[:n ] = @steps.count('n')

      n = steps[:n] - steps[:s]
      ne = steps[:ne] - steps[:sw]
      se = steps[:se] - steps[:nw]
      ne += se
      n -= se

      if n < 0
        se = [[-n,ne].min,0].max
        n += se
        ne -= se
      else
        se = [[n,-ne].min,0].max
        n -= se
        ne += se
      end

      output = []
      if n >= 0
        output += ['n']*n
      else
        output += ['s']*(-n)
      end
      if ne >= 0
        output += ['ne']*ne
      else
        output += ['sw']*(-ne)
      end
      if se >= 0
        output += ['se']*se
      else
        output += ['nw']*(-se)
      end

      output
    end

    def furthest
      max = 0
      for length in 1..@steps.size do
        res = HexPath.new(@steps[0,length]).simplify.size
        max = [max, res].max
      end
      max
    end
  end

  def self.parse(path)
    HexPath.new(path.split(','))
  end
end
