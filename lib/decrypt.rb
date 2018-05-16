require './lib/enigma'

file = File.open(ARGV[0], 'r')
incoming_text = file.read.chomp
file.close

e = Enigma.new
output = e.decrypt(incoming_text, ARGV[2], ARGV[3])

new_file = File.open(ARGV[1], 'w')
new_file.write(output)
new_file.close

puts "Created 'decrypted.txt' with the key #{e.key} and date #{e.decrypt_date}"
