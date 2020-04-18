require './test/test_helper'
require './lib/enigma'

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
    assert_equal "6400", enigma.offset("180420")
    assert_equal "6400", enigma.offset(180420)
    assert_equal 4, enigma.offset.length
  end

end 
