require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require 'pry'

class DecryptTest < Minitest::Test
  def test_it_exists
    decrypt = Decrypt.new

    assert_instance_of Decrypt, decrypt
  end
end
