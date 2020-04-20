require './test/test_helper'
require './lib/enigma'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @key = @enigma.keys
    @date = @enigma.date

  end

  def test_it_exsists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_readable_attributes
    char_set = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal char_set, @enigma.character_set
    assert_equal 6, @enigma.date.length
    assert_equal 5, @enigma.key.length
  end

  def test_it_can_generate_rand_key
    assert_instance_of String, @enigma.keys
    assert_equal 5, @enigma.keys.length
  end

  def test_it_can_create_offset
    assert_equal [6, 4, 0, 0], @enigma.offset("180420")
    assert_equal [6, 4, 0, 0], @enigma.offset(180420)
    assert_equal 4, @enigma.offset.length
  end

  def test_it_can_shift
    assert_equal [8, 27, 34, 45], @enigma.shift('02345', @date)
  end

  def test_it_can_convert_string_to_array
    assert_instance_of Array, @enigma.convert_string_into_array(@key)
    assert_equal 4, @enigma.convert_string_into_array(@key).length
  end

  def test_it_can_encrypt
    hash = {:encryption=>"keder ohulw", :key=>"02715", :date=>"040895"}
    assert_equal hash, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt
    decrypt = {:decryption=>"hello world", :key=>"02715", :date=>"040895"}
    assert_equal decrypt, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

end
