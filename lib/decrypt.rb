require 'date'
require './lib/enigma'


enigma = Enigma.new
date = enigma.date

handle = File.open(ARGV[0], "r")
incoming_text = handle.read.chomp
encrypted_msg = enigma.decrypt(incoming_text, ARGV[2], ARGV[3] = date)
writer = File.open(ARGV[1], "w")
writer.write(encrypted_msg[:decryption])
writer.close

p "Created 'decrypted.txt' with the key #{ARGV[2]} and date #{ARGV[3]}"
#ruby lib/decrypt.rb lib/encrypted.txt lib/decrypted_message.txt
#ruby lib/decrypt.rb lib/encrypted.txt lib/decrypted.txt 82648 240818
#ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
