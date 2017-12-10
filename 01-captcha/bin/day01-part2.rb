require_relative '../lib/captcha'

f = File.open('data/day01')
input = f.gets.chomp
captcha = Captcha.new(input, halfway: true)
answer = captcha.sum

puts "For input #{input}, answer is #{answer}."
