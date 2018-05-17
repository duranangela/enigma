require './lib/enigma'

file = File.open(ARGV[0], 'r')
incoming_text = file.read.chomp
file.close

e = Enigma.new
output = e.crack(incoming_text, ARGV[2])

new_file = File.open(ARGV[1], 'w')
new_file.write(output)
new_file.close

puts "Created 'cracked.txt' with the cracked key #{e.cracked_key} and date #{e.crack_date}"
