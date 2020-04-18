require './test/test_helper'
require './lib/enigma'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test

  def test_it_exsists

    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_has_readable_attributes

    enigma = Enigma.new

    character_set_array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal character_set_array, enigma.character_set
  end

  def test_it_can_generate_rand_key
    enigma = Enigma.new
    assert_instance_of String, enigma.keys
    assert_equal 5, enigma.keys.length
  end

  def test_it_can_create_offset
    enigma = Enigma.new
    assert_equal [6, 4, 0, 0], enigma.offset("180420")
    assert_equal [6, 4, 0, 0], enigma.offset(180420)
    assert_equal 4, enigma.offset.length
  end

  def test_it_can_shift
    
    enigma = Enigma.new
    key = enigma.keys
    date = enigma.date

    assert_instance_of Hash, enigma.shift('02345', date)
  end

  def test_it_can_convert_string_to_array
    enigma = Enigma.new
    key = enigma.keys
    date = enigma.date

    assert_instance_of Array, enigma.convert_string_into_array(key)
    assert_equal 4, enigma.convert_string_into_array(key).length
  end

end
