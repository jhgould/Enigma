require 'pry';
class Enigma
  attr_reader :character_set, :date, :key

  def initialize
    @character_set = ("a".."z").to_a << " "
    @date = Date.today.strftime("%d%m%y")
    @key = keys
  end

# creates a 5 digit key and then converts them into strings
#so that they can be turned into an array

  def keys
    key = 5.times.map do |num|
      rand(9).to_s
    end
    key.join
  end

  #generates the offset by using todays date or off user input
  def offset(date = @date)
    num = date.to_i ** 2
    num.to_s[-4..-1].split(//).map{|chr| chr.to_i}
  end

  #takes the key and date as args and returns a hash
  def shift(key, date)
    # shift_keys = [:A, :B, :C, :D]
    key = convert_string_into_array(key)
    offset = offset(date)
    shift_value = key.zip(offset)
      shift_amount = shift_value.map do |num|
         num.sum
      end
      shift_amount
      # shift_keys.zip(shift_amount).to_h
  end

  # takes key as arg and returns an array of ints that
  #can be converted to hash in shift method
  def convert_string_into_array(string)
    string_keys = []
      loop do
        if string.size >= 2
          string_keys << string[0] + string[1]
          string = string[1..-1]
        else
          break
        end
      end
      string_keys.map{|num| num.to_i}
  end

  #uses two helper methods below to encrypt a string
  def encrypt(string, key = @key, date = @date)
    shift_array = shift_array_generator(string, key, date)
      encryption = rotate(string, shift_array)
        enigma_code = { encryption: encryption,
                        key: key,
                        date: date}
    # encrip = shift_array(string, key, date)
    # binding.pry
  end

 #output hash that will have encrypted string key and date
 # h is at index 9 so take index 9 from char set a
  def shift_array_generator(string, key, date)
    index_values = []
    shift_amount = shift(key, date)
    scan_string = string.split('').join(',').split(",")
      scan_string.each do |character|
          index_values << @character_set.find_index(character)
      end
      index_values
      new_shift_amount = []
      while new_shift_amount.length < index_values.length
        shift_amount.each do |value|
            new_shift_amount << value
          end
      end
      new_shift_amount
      full_shift = index_values.zip(new_shift_amount)
        full_shift_amount = full_shift.map do |num|
           num.sum
        end
      full_shift_amount
  end

  #rotates four seperate character sets based off their key value pair
  #from shift_amount. Will be able to access these to encrypt

  def rotate(string, encription_array)
    encrypted_word = []
    string_array = string.split('').join(',').split(",")
    # encription_array = encrypt(string, key, date)
      encription_array.each do |index|
        nc = @character_set.rotate(index)
        encrypted_word << nc[0]
      end
    encrypted_word.join
  end

  def decrypt_message(string, encription_array)
    encrypted_word = []
    string_array = string.split('').join(',').split(",")
    # encription_array = encrypt(string, key, date)
      encription_array.each do |index|
        nc = @character_set.rotate(index)
        encrypted_word << nc[0]
      end
    encrypted_word.join
  end

  def shift_array_generator_decrypt(string, key, date)
    index_values = []
    shift_amount = shift(key, date)
    scan_string = string.split('').join(',').split(",")
      scan_string.each do |character|
          index_values << @character_set.find_index(character)
      end
      index_values
      new_shift_amount = []
      while new_shift_amount.length < index_values.length
        shift_amount.each do |value|
            new_shift_amount << value
          end
      end
      new_shift_amount
      full_shift = index_values.zip(new_shift_amount)
        full_shift_amount = full_shift.map do |num|
           num[0] - num[1]
        end
      full_shift_amount
  end



  def decrypt(message, key, date = @date)
          shift = shift_array_generator_decrypt(message, key, date)
            decrypted_message = decrypt_message(message, shift)
    decrypted_enigma_code = {decryption: decrypted_message,
                             key: key,
                             date: date}
  end


end





# shift_value = []
# key.each do |key_num|
#   offset.each do |offset_num|
#     shift_value << key_num + offset_num
#   end
# end
# shift_value
# binding.pry
