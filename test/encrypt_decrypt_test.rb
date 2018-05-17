require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt_decrypt'

class EncryptDecryptTest < Minitest::Test

  def test_it_exists
    cipher = EncryptDecrypt.new('enc', 'this is so secret ..end..', '12345', '051618')
    assert_instance_of EncryptDecrypt, cipher
  end

  def test_it_has_attributes
    cipher = EncryptDecrypt.new('enc', 'this is so secret ..end..', '12345', '051618')
    assert_equal ['t', 'h', 'i', 's', ' ', 'i', 's', ' ', 's', 'o', ' ', 's', 'e', 'c', 'r', 'e', 't', ' ', '.', '.', 'e', 'n', 'd', '.', '.'], cipher.in_message
    assert_equal '12345', cipher.key
    assert_equal '051618', cipher.date
    assert_equal 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 !@#$%^&*()[],.<>;:/?\|'.split(//), cipher.charmap
  end

  def test_the_a__b_c_d_of_rotations
    cipher = EncryptDecrypt.new('enc', 'this is so secret ..end..', '12345', '020315')
    assert_equal 21, cipher.rotation.a_rotation
    assert_equal 25, cipher.rotation.b_rotation
    assert_equal 36, cipher.rotation.c_rotation
    assert_equal 50, cipher.rotation.d_rotation
  end

  def test_it_encrypts
    encrypt = EncryptDecrypt.new('enc', 'this is so secret ..end..', '12345', '051618')
    assert_equal '@#*I/$:a!)NIx8;;@Jbox(#oK', encrypt.output
  end

  def test_it_encrypts_something_different
    encrypt = EncryptDecrypt.new('enc', 'secret message ..end..', '54321', '020315')
    assert_equal 'W, &IFL@IE>0K,LR2,[32k', encrypt.output
  end

  def test_it_decrypts
    decrypt = EncryptDecrypt.new('dec', '@#*I/$:a!)NIx8;;@Jbox(#oK', '12345', '051618')
    assert_equal 'this is so secret ..end..', decrypt.output
  end

  def test_it_decrypts_something_different
    decrypt = EncryptDecrypt.new('dec', 'W, &IFL@IE>0K,LR2,[32k', '54321', '020315')
    assert_equal 'secret message ..end..', decrypt.output
  end
end
