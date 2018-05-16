require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt_decrypt'
require 'pry'

class EncryptDecryptTest < Minitest::Test

  def test_it_exists
    cipher = EncryptDecrypt.new('this is so secret ..end..', '12345', '051618')
    assert_instance_of EncryptDecrypt, cipher
  end

  def test_it_has_attributes
    cipher = EncryptDecrypt.new('this is so secret ..end..', '12345', '051618')
    assert_equal ['t', 'h', 'i', 's', ' ', 'i', 's', ' ', 's', 'o', ' ', 's', 'e', 'c', 'r', 'e', 't', ' ', '.', '.', 'e', 'n', 'd', '.', '.'], cipher.in_message
    assert_equal '12345', cipher.key
    assert_equal '051618', cipher.date
    assert_equal 'abcdefghijklmnopqrstuvwxyz0123456789 .,'.split(//), cipher.charmap
  end

  def test_the_a__b_c_d_of_rotations
    cipher = EncryptDecrypt.new('this is so secret ..end..', '12345', '020315')
    assert_equal 21, cipher.rotation.a_rotation
    assert_equal 25, cipher.rotation.b_rotation
    assert_equal 36, cipher.rotation.c_rotation
    assert_equal 50, cipher.rotation.d_rotation
  end

  def test_it_encrypts
    encrypt = EncryptDecrypt.new('this is so secret ..end..', '12345', '051618')
    assert_equal ',af2qbph.h72x8oo,38ixgair', encrypt.encrypt
  end

  def test_it_encrypts_something_different
    encrypt = EncryptDecrypt.new('secret message ..end..', '54321', '020315')
    assert_equal 'dk e2z5,2yn04k5ywki3we', encrypt.encrypt
  end

  def test_it_decrypts
    decrypt = EncryptDecrypt.new(',af2qbph.h72x8oo,38ixgair', '12345', '051618')
    assert_equal 'this is so secret ..end..', decrypt.decrypt
  end

  def test_it_decrypts_something_different
    decrypt = EncryptDecrypt.new('dk e2z5,2yn04k5ywki3we', '54321', '020315')
    assert_equal 'secret message ..end..', decrypt.decrypt
  end
end
