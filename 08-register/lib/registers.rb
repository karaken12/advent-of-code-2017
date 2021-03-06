class Registers
  def initialize
    @registers = Hash.new
    @highest_value = 0
  end

  def instruct(instructions)
    instructions.each do |instruction|
      if evaluate_condition(instruction.condition)
        amount = instruction.amount
        if not instruction.increase
          amount = -amount
        end
        @registers[instruction.register] = self[instruction.register] + amount
        if self[instruction.register] > @highest_value
          @highest_value = self[instruction.register]
        end
      end
    end
  end

  def evaluate_condition(condition)
    lhs = self[condition.register]
    rhs = condition.constant
    case condition.comparison
    when '<'
      lhs < rhs
    when '>'
      lhs > rhs
    when '<='
      lhs <= rhs
    when '>='
      lhs >= rhs
    when '=='
      lhs == rhs
    when '!='
      lhs != rhs
    else
      raise "Do not know how to evaluate comparison #{condition.comparison}."
    end
  end

  def [](register)
    if @registers.has_key? register
      @registers[register]
    else
      0
    end
  end

  def largest_value
    @registers.values.max
  end

  def highest_value
    @highest_value
  end
end
