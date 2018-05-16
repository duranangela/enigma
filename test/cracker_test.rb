require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cracker'
require 'pry'

class CrackTest < Minitest::Test

  def test_it_exists
    crack = Crack.new('y3 ws4l2skl5szko', '020315')
    assert_instance_of Crack, crack
  end

  def test_it_has_attributes
    crack = Crack.new("a3,2zf7xzepl137jt3kotx", '020315')
    assert_equal "a3,2zf7xzepl137jt3kotx", crack.encrypted_message
    assert_equal '020315', crack.date
    assert_equal '00000', crack.key
  end

  def test_it_can_figure_out_the_key
    # skip
    crack = Crack.new("a3,2zf7xzepl137jt3kotx", '020315')
    # binding.pry
    assert_equal '12345', crack.key_output
  end

  def test_it_can_crack_a_different_key
    # skip
    crack = Crack.new("4zv7i05mz,4mlbr7z4rmn9nrvplnp5qnj", '051418')
    assert_equal '11111', crack.key_output
  end

end
