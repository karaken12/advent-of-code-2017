class Tower
  attr_reader :bottom

  Program = Struct.new(:name, :weight, :holding)

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
    @bottom = programs.select{|p| p.name == unheld[0]}.first
  end
end
