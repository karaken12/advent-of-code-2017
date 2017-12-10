require_relative '../lib/reader'

input = File.read('data/day02')
sheet = Reader.read_sheet(input)
checksum = sheet.checksum
division = sheet.divisible_sum

puts "For spreadsheet:\n#{input}\nchecksum is #{checksum}\ndivisible sum is #{division}"
