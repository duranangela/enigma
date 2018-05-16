require './lib/enigma'

handle = File.open(ARGV[0], 'r')
incoming_text = handle.read.chomp
handle.close

e = Enigma.new
output = e.encrypt(incoming_text)

writer = File.open(ARGV[1], 'w')
writer.write(output)
writer.close

puts "Created 'encrypted.txt' with the key #{e.key} and date #{e.date}"
