require 'date'
require './lib/enigma'

enigma = Enigma.new

key = enigma.key
date = enigma.date

handle = File.open(ARGV[0], "r")
incoming_text = handle.read.chomp.downcase
encrypted_msg = enigma.encrypt(incoming_text, key, date)
writer = File.open(ARGV[1], "w")
writer.write(encrypted_msg[:encryption])
writer.close

p "Created 'encrypted.txt' with the key #{key} and date #{date}"

#ruby lib/encrypt.rb lib/encrypt_message.txt lib/encrypted.txt
