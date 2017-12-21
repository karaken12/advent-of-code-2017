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
    group_containing(0).size
  end

  def groups
    groups = []
    groups << group_containing(0)
    left = @programs.map{|p| p.id} - groups.flatten
    while left.size > 0
      groups << group_containing(left.first)
      left = @programs.map{|p| p.id} - groups.flatten
    end
    groups
  end

  def group_containing(start)
    in_group = [start]
    checked = []

    while (in_group - checked).size > 0 do
      check_id = (in_group - checked).first
      prog = @programs.select{|p| p.id == check_id}.first
      in_group = (in_group + prog.connections).uniq
      checked << check_id
    end
    in_group
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
