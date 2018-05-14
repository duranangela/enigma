require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack'
require 'pry'

class CrackTest < Minitest::Test

  def test_it_exists
    crack = Crack.new('y3 ws4l2skl5szko', '020315')
    assert_instance_of Crack, crack
  end

  def test_it_has_attributes
    crack = Crack.new('y3 ws4l2skl5szko', '020315')
    assert_equal 'y3 ws4l2skl5szko'.split(//), crack.encrypted_message
    assert_equal '020315', crack.date
    assert_equal "abcdefghijklmnopqrstuvwxyz0123456789 .,".split(//), crack.charmap
  end

  def test_it_can_crack
    skip
    crack = Crack.new('y3 ws4l2skl5szko', '020315')
    assert_equal 'deal for you and', crack.output
  end

  def test_it_can_crack_a_different_message
    skip
    crack = Crack.new("lx1c2y.ug  u5,xcg2xu77tzcnrv93wv3", '051418')
    assert_equal 'this is our awesome crack ..end..', crack.output
  end

end
