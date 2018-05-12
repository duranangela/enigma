require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    e = Enigma.new
    assert_instance_of Enigma, e
  end

  def test_it_encrypts
    e = Enigma.new
    assert_equal 'msg', e.encrypt('msg')
  end

end
