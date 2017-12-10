require_relative '../lib/captcha'

puts "Enter string:"
input = gets.chomp
captcha = Captcha.new(input)
answer = captcha.sum

puts "For input #{input}, answer is #{answer}."
