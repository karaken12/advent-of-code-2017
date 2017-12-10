require_relative '../lib/passphrase'

phrase_count = 0
valid_phrases = 0
File.readlines('./data/phrases').each do |phrase|
  phrase_count += 1
  valid_phrases += 1 if Passphrase.new(phrase).valid
end

puts "Of the #{phrase_count} phrases, #{valid_phrases} are valid."
