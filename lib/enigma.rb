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
    off = num.to_s[-4..-1]
  end
  # num.to_s[-4..-1].split(//).map{|chr| chr.to_i}






  # def convert_string_of_keys_into_array_of_ints(key)
  #   string_keys = []
  #     loop do
  #       if key.length >= 2
  #         string_keys << key[0] + key[1]
  #         key.shift
  #       else
  #         break
  #       end
  #     end
  #     string_keys.map{|num| num.to_i}
  # end
  #

end
