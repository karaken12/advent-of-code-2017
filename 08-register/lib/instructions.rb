class Instructions
  Instruction = Struct.new(:register, :increase, :amount, :condition)
  Condition = Struct.new(:register, :comparison, :constant)

  def Instructions.parse(lines)
    lines.lines.map do |line|
      Instructions.parse_line(line.strip)
    end
  end

  def Instructions.parse_line(line)
    tokens = line.split(' ')
    Instruction.new(
      tokens[0],
      tokens[1] == 'inc',
      tokens[2].to_i,
      Condition.new(
        tokens[4],
        tokens[5],
        tokens[6].to_i
      )
    )
  end
end
