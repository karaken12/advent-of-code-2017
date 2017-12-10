class Row
  attr_reader :largest, :smallest, :difference

  def initialize(values)
    @largest = values.max
    @smallest = values.min
    @difference = @largest - @smallest
  end
end
