require './lib/enigma'

handle = File.open(ARGV[0], 'r')
incoming_text = handle.read.chomp
handle.close

e = Enigma.new
output = e.decrypt(incoming_text, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], 'w')
writer.write(output)
writer.close

puts "Created 'decrypted.txt' with the key #{e.key} and date #{e.decrypt_date}"
