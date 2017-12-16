#!/usr/bin/env ruby

require_relative '../lib/maze'

data = File.readlines('./data/maze').map{|i| i.to_i}
maze = Maze.new(data)
maze.escape

puts "For this maze, it took #{maze.step} steps to escape."
