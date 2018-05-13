require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'

class EncryptTest < Minitest::Test

  def test_it_exists
    encrypt = Encrypt.new('my_message', '12345', '051318')
    assert_instance_of Encrypt, encrypt
  end

  def test_it_has_attributes
    encrypt = Encrypt.new('my_message', '12345', '051318')
    assert_equal ["m", "y", "_", "m", "e", "s", "s", "a", "g", "e"], encrypt.my_message
    assert_equal '12345', encrypt.key
    assert_equal '051318', encrypt.date
    assert_equal "abcdefghijklmnopqrstuvwxyz0123456789 .,".split(//), encrypt.char_map
  end

  def test_only_message_argument_needed
    encrypt = Encrypt.new('my_message')

    assert_equal ["m", "y", "_", "m", "e", "s", "s", "a", "g", "e"], encrypt.my_message
  end

  def test_only_message_and_date_argument_needed
    encrypt = Encrypt.new('my_message', '020315')

    assert_equal ["m", "y", "_", "m", "e", "s", "s", "a", "g", "e"], encrypt.my_message
    assert_equal '020315', encrypt.date
  end

  def test_the_a__b_c_d_of_rotations
    encrypt = Encrypt.new('my_message', '12345', '020315')

    assert_equal 21, encrypt.a_rotation
    assert_equal 25, encrypt.b_rotation
    assert_equal 36, encrypt.c_rotation
    assert_equal 50, encrypt.d_rotation
  end

end
