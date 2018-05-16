require './lib/enigma'

handle = File.open(ARGV[0], 'r')
incoming_text = handle.read.chomp
handle.close

e = Enigma.new
output = e.crack(incoming_text, ARGV[2])

writer = File.open(ARGV[1], 'w')
writer.write(output)
writer.close

puts "Created 'cracked.txt' with the cracked key #{e.cracked_key} and date #{e.crack_date}"
