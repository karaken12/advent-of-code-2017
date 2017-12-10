require_relative '../lib/spiral'

input = 312051
vector = SpiralMemory.home_vector(input)
distance = vector.length

puts "Data from square #{input} must be carried #{distance} steps."
