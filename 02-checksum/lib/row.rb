class Row
  attr_reader :data, :largest, :smallest, :difference

  def initialize(values)
    @data = values
    @largest = values.max
    @smallest = values.min
    @difference = @largest - @smallest
  end
end
