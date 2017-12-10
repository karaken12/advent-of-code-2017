require_relative '../lib/reader'

input = File.read('data/day02')
sheet = Reader.read_sheet(input)
answer = sheet.checksum

puts "For spreadsheet:\n#{input}\nchecksum is #{answer}."
