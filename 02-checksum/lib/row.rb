class Row
  attr_reader :data, :largest, :smallest, :difference

  def initialize(values)
    @data = values
    @largest = values.max
    @smallest = values.min
    @difference = @largest - @smallest
  end

  def divisors
    find_even_divisors
  end

  def division
    divisors[0]/divisors[1]
  end

  def find_even_divisors
    for i in 0..@data.length-1 do
      for j in 0..@data.length-1 do
        if (i==j) then next end
        a = @data[i]
        b = @data[j]
        if (a % b) == 0 then
          return [a,b]
        end
      end
    end
    raise "exception"
  end
end
