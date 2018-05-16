require './lib/enigma'

file = File.open(ARGV[0], 'r')
incoming_text = file.read.chomp
file.close

e = Enigma.new
output = e.encrypt(incoming_text)

new_file = File.open(ARGV[1], 'w')
new_file.write(output)
new_file.close

puts "Created 'encrypted.txt' with the key #{e.key} and date #{e.date}"
