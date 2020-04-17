require 'pry';
class Enigma
  attr_reader :character_set, :date

  def initialize
    @character_set = ("a".."z").to_a << " "
    @date = Date.today.strftime("%d%m%y")

  end


  def keys
    key = 4.times.map do |num|
      rand(99)
    end
    key
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

end
