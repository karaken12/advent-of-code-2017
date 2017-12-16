#!/usr/bin/env ruby

require_relative '../lib/blocks'

data = File.read('./data/blocks').split("\t").map{|i| i.to_i}
puts "Starting data: [#{data.join(', ')}]"
blocks = Blocks.new data
blocks.detect_cycle

puts "This starting set of blocks produces a cycle after #{blocks.step} steps."
