require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exsists
    skip
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_has_readable_attributes
    skip
    enigma = Enigma.new

    character_set_array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal character_set_array, enigma.character_set
  end

  def test_it_can_generate_rand_key

    enigma = Enigma.new

    assert_instance_of Array, enigma.keys
    assert_equal 4, enigma.keys.length

  end

  def test_it_can_convert_string_keys_to_array_of_ints
    skip
    enigma = Enigma.new
    key = enigma.keys
    # assert_instance_of Array, enigma.convert_string_of_keys_into_array_of_ints(key)
    assert_equal 4, enigma.convert_string_of_keys_into_array_of_ints(key).length
  end

  def test_it_can_square

    enigma = Enigma.new
    assert_equal [6,4,0,0], enigma.offset
  end

  def test_it_can_shift

    enigma = Enigma.new
    assert_instance_of Hash, enigma.shift
    assert_equal 4, enigma.shift.length
  end

  def test_it_can_convert_string_into_hash
    
    enigma = Enigma.new

    assert_instance_of Hash, enigma.convert_string_into_hash("12345")
  end

  def test_it_can_encrypt
    skip
    enigma = Enigma.new
    assert_equal 0, enigma.encrypt("Hello World,")
    assert_equal 0, enigma.encrypt("Hello World with key and date," "12345", "432100")
  end
end
