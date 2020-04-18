require 'pry';
class Enigma
  attr_reader :character_set, :date

  def initialize
    @character_set = ("a".."z").to_a << " "
    @date = Date.today.strftime("%d%m%y")
  end

# creates a 5 digit key and then converts them into strings
#so that they can be turned into an array
  def keys
    key = 5.times.map do |num|
      rand(9).to_s
    end
    convert_string_of_keys_into_array_of_ints(key)
  end

  def convert_string_of_keys_into_array_of_ints(key)
    #while not empty? == true
    string_keys = []
      loop do
        if key.length >= 2
          string_keys << key[0] + key[1]
          key.shift
        else
          break
        end
      end
      string_keys.map{|num| num.to_i}
  end

  def offset
    num = @date.to_i ** 2
    num.to_s[-4..-1].split(//).map{|chr| chr.to_i}
  end

  def shift
    shift_keys = [:A, :B, :C, :D]
    shift_values = []
    keys.each do |key|
      offset.each do |num|
        shift_values << key + num
      end
    end
    shift_keys.zip(shift_values).to_h
  end

  def convert_string_into_hash(string)
      binding.pry
  end

  def encrypt(message, key = shift, date = @date)
    binding.pry
  end

end
