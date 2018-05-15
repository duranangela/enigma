require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require 'pry'

class DecryptTest < Minitest::Test
  def test_it_exists
    decrypt = Decrypt.new('5j7wxdpkz2', '12345', '051318')

    assert_instance_of Decrypt, decrypt
  end

  def test_it_has_attributes
    decrypt = Decrypt.new('5j7wxdpkz2', '12345', '051318')
    assert_equal ["5", "j", "7", "w", "x", "d", "p", "k", "z", "2"], decrypt.encrypted_message
    assert_equal '12345', decrypt.key
    assert_equal '051318', decrypt.date
    assert_equal "abcdefghijklmnopqrstuvwxyz0123456789 .,".split(//), decrypt.charmap
  end
end
