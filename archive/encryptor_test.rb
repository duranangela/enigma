# require 'minitest/autorun'
# require 'minitest/pride'
# require './lib/encryptor'
#
# class EncryptTest < Minitest::Test
#
#   def test_it_exists
#     encrypt = Encrypt.new('my message', '12345', '051318')
#     assert_instance_of Encrypt, encrypt
#   end
#
#   def test_it_has_attributes
#     encrypt = Encrypt.new('my message', '12345', '051318')
#     assert_equal ["m", "y", " ", "m", "e", "s", "s", "a", "g", "e"], encrypt.in_message
#     assert_equal '12345', encrypt.key
#     assert_equal '051318', encrypt.date
#     assert_equal "abcdefghijklmnopqrstuvwxyz0123456789 .,".split(//), encrypt.charmap
#   end
#
#   def test_the_a__b_c_d_of_rotations
#     encrypt = Encrypt.new('my message', '12345', '020315')
#
#     assert_equal 21, encrypt.rotation.a_rotation
#     assert_equal 25, encrypt.rotation.b_rotation
#     assert_equal 36, encrypt.rotation.c_rotation
#     assert_equal 50, encrypt.rotation.d_rotation
#   end
#
#   def test_it_encrypts
#     encrypt = Encrypt.new('my message', '12345', '051318')
#
#     assert_equal "5j7wxdpkz2", encrypt.output
#   end
#
#   def test_it_encrypts_something_different
#     encrypt = Encrypt.new('secret message ..end..', '54321', '020315')
#
#     assert_equal "dk e2z5,2yn04k5ywki3we", encrypt.output
#   end
# 
# end
