require 'date'
require './lib/enigma'

enigma = Enigma.new
handle = File.open(ARGV[0], "r")
incoming_text = handle.read.chomp
encrypted_msg = enigma.decrypt(incoming_text, "02715", "040895")
writer = File.open(ARGV[1], "w")
writer.write(encrypted_msg[:decryption])
writer.close
#ruby lib/decrypt_file.rb lib/encrypted.txt lib/decrypted_message.txt
