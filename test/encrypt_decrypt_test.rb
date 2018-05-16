require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt_decrypt'
require 'pry'

class EncryptDecryptTest < Minitest::Test
  def test_it_exists
    decrypt = EncryptDecrypt.new('5j7wxdpkz2', '12345', '051318')

    assert_instance_of EncryptDecrypt, decrypt
  end

  def test_it_has_attributes
    decrypt = EncryptDecrypt.new('5j7wxdpkz2', '12345', '051318')
    assert_equal ["5", "j", "7", "w", "x", "d", "p", "k", "z", "2"], decrypt.in_message
    assert_equal '12345', decrypt.key
    assert_equal '051318', decrypt.date
    assert_equal "abcdefghijklmnopqrstuvwxyz0123456789 .,".split(//), decrypt.charmap
  end

  def test_the_a__b_c_d_of_rotations
    decrypt = EncryptDecrypt.new('5j7wxdpkz2', '12345', '020315')

    assert_equal 21, decrypt.rotation.a_rotation
    assert_equal 25, decrypt.rotation.b_rotation
    assert_equal 36, decrypt.rotation.c_rotation
    assert_equal 50, decrypt.rotation.d_rotation
  end

  def test_it_decrypts
    decrypt = EncryptDecrypt.new('5j7wxdpkz2', '12345', '051318')

    assert_equal "my message", decrypt.output
  end

  def test_it_decrypts_something_different
    decrypt = EncryptDecrypt.new('dk e2z5,2yn04k5ywki3we', '54321', '020315')

    assert_equal "secret message ..end..", decrypt.output
  end
end
