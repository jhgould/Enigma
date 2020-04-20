require 'date'
require './lib/enigma'

enigma = Enigma.new
handle = File.open(ARGV[0], "r")
incoming_text = handle.read.chomp
encrypted_msg = enigma.encrypt(incoming_text, "02715", "040895")
writer = File.open(ARGV[1], "w")
writer.write(encrypted_msg[:encryption])
writer.close


#ruby lib/encrypt_file.rb lib/encrypt_message.txt lib/encrypted.txt
