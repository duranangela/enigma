require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'

class EncryptTest < Minitest::Test

  def test_it_exists
    encrypted = Encrypt.new('msg', '12345', '051118')
    assert_instance_of Encrypt, encrypted
  end

  def test_it_has_attributes
    encrypted = Encrypt.new('msg', '12345', '051118')
    assert_equal 'msg', encrypted.msg
    assert_equal '12345', encrypted.key
    assert_equal '051118', encrypted.date
    assert_equal "abcdefghijklmnopqrstuvwxyz0123456789 .,".split(//), encrypted.map
  end


end
