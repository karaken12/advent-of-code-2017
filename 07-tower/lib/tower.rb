class Tower
  attr_reader :bottom

  Program = Struct.new(:name, :weight, :holding) do
    def balanced
      holding.size == 0 || holding.map{|p| p.stack_weight}.uniq.size == 1
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
end
