class Pipes
  ProgramDefn = Struct.new(:id, :connections) do
    def to_s
      "#{id} <-> #{connections.join(', ')}"
    end
  end

  def initialize(programs)
    @programs = programs
  end

  def group_size
    5
  end

  def self.parse(input)
    conns = []
    input.lines.each do |line|
      program, connections = line.split('<->')
      program = program.strip.to_i
      connections = connections.split(',').map {|p| p.strip.to_i}
      conns << ProgramDefn.new(program, connections)
    end
    Pipes.new conns
  end
end
