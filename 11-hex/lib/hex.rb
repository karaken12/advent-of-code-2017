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

      cancel = [steps[:n], steps[:s]].min
      steps[:n] -= cancel
      steps[:s] -= cancel
      cancel = [steps[:ne], steps[:sw]].min
      steps[:ne] -= cancel
      steps[:sw] -= cancel
      cancel = [steps[:nw], steps[:se]].min
      steps[:nw] -= cancel
      steps[:se] -= cancel

      cancel = [steps[:ne], steps[:s]].min
      steps[:ne] -= cancel
      steps[:s] -= cancel
      steps[:se] += cancel

      cancel = [steps[:nw], steps[:s]].min
      steps[:nw] -= cancel
      steps[:s] -= cancel
      steps[:sw] += cancel

      cancel = [steps[:se], steps[:n]].min
      steps[:se] -= cancel
      steps[:n] -= cancel
      steps[:ne] += cancel

      cancel = [steps[:sw], steps[:n]].min
      steps[:sw] -= cancel
      steps[:n] -= cancel
      steps[:nw] += cancel

      (
        ['ne']*steps[:ne] +
        ['se']*steps[:se] +
        ['s']*steps[:s] +
        ['sw']*steps[:sw] +
        ['nw']*steps[:nw] +
        ['n']*steps[:n]
      )
    end
  end

  def self.parse(path)
    HexPath.new(path.split(','))
  end
end