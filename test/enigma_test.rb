require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exsists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

end
