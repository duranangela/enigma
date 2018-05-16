require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cracker'
require 'pry'

class CrackTest < Minitest::Test

  def test_it_exists
    crack = Crack.new(',af2qbph.h72x8oo,38ixgair', '051618')
    assert_instance_of Crack, crack
  end

  def test_it_has_attributes
    crack = Crack.new(',af2qbph.h72x8oo,38ixgair', '051618')
    assert_equal ',af2qbph.h72x8oo,38ixgair', crack.encrypted_message
    assert_equal '051618', crack.date
    assert_equal '00000', crack.key
  end

  def test_it_can_crack_a_key
    crack = Crack.new(',af2qbph.h72x8oo,38ixgair', '051618')
    assert_equal '12345', crack.key_output
  end

  def test_it_can_crack_a_different_key
    crack = Crack.new('4zv7i05mz,4mlbr7z4rmn9nrvplnp5qnj', '051418')
    assert_equal '11111', crack.key_output
  end

end
