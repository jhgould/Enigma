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
    key.join
  end

  #generates the offset by using todays date or off user input
  def offset(date = @date)
    num = date.to_i ** 2
    num.to_s[-4..-1].split(//).map{|chr| chr.to_i}
  end

  def shift(key, date)
    shift_keys = [:A, :B, :C, :D]
    key = convert_string_into_array(key)
    offset = offset(date)
    shift_value = key.zip(offset)
      shift_amount = shift_value.map do |num|
         num.sum
      end
      shift_keys.zip(shift_amount).to_h
  end


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

end





# shift_value = []
# key.each do |key_num|
#   offset.each do |offset_num|
#     shift_value << key_num + offset_num
#   end
# end
# shift_value
# binding.pry
