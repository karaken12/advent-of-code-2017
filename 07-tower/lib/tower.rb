class Tower
  attr_reader :bottom

  Program = Struct.new(:name, :weight, :holding) do
    def balanced
      holding.size == 0 || holding.map{|p| p.stack_weight}.uniq.size == 1
    end

    def balance
      unb = unbalancer
      change_required = expected_subtower_weight - unb.stack_weight
      unb.weight += change_required
    end

    def unbalancer
      holding[odd_subtower_index]
    end

    def expected_subtower_weight
      if odd_subtower_index == 0
        holding[1].stack_weight
      else
        holding[0].stack_weight
      end
    end

    def odd_subtower_index
      if balanced
        raise 'Not unbalanced!'
      end

      weights = holding.map{|p| p.stack_weight}
      weight_counts = Hash.new(0)
      weights.each do |weight|
        weight_counts[weight] += 1
      end
      weight_counts.each do |weight,count|
        if count == 1
          return weights.index(weight)
        end
      end

      raise "No weight is unique: #{weights}"
    end

    def stack_weight
      weight + holding.sum{|p| p.stack_weight}
    end
  end

  def Tower.parse(lines)
    programs = []
    lines.lines.each do |line|
      line = line.strip
      if line == ''
        next
      end
      match = /^(.*) \((\d*)\)(?: -> (.*))?$/.match(line)
      if !match
        raise "There's a problem with this line: #{line}"
      end
      name = match[1]
      weight = match[2].to_i
      holding = match[3] ? match[3].split(', ') : []
      programs << Program.new(name, weight, holding)
    end
    Tower.new(programs)
  end

  def initialize(programs)
    names = []
    held = []
    programs.each do |program|
      names << program.name
      held += program.holding
    end
    unheld = names - held
    if unheld.size != 1
      raise "Some problem here: #{unheld}"
    end
    @bottom = create_program_stack(programs, unheld[0])
  end

  def create_program_stack(programs, name)
    prog = programs.select{|p| p.name == name}.first
    # TODO: throw if none or more than one names are possible
    holding = prog.holding.map{|p| create_program_stack(programs, p)}
    Program.new(prog.name, prog.weight, holding)
  end

  def unbalanced_program
    unbalanced = []
    current = @bottom
    walk_tower(unbalanced, @bottom)

    # TODO: unbalanced should contain a stack with a unique end
    # For now, just take the last one.
    unbalanced.last
  end

  def unbalancer
    unbalanced_program.unbalancer
  end

  def balance
    unbalanced_program.balance
  end

  def walk_tower(unbalanced, current)
    if not current.balanced
      unbalanced << current
    end
    current.holding.each{|p| walk_tower(unbalanced, p)}
  end
end
